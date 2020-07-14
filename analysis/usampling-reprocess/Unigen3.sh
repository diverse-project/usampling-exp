#!/bin/bash
#OAR -l nodes=1/thread=16,walltime=24:00:00 
#OAR -p virt='YES' AND cluster='armada'
#OAR -O /temp_dd/igrida-fs1/macher/usampling/oar_output/job.%jobid%.output
#OAR -E /temp_dd/igrida-fs1/macher/usampling/oar_output/job.%jobid%.error

. /etc/profile.d/modules.sh

set -x

module load spack/gvirt

VM_NAME=vm-${OAR_JOBID}

gvirt start ${VM_NAME} --image /srv/tempdd/macher/usampling/docker-alpine-usampling.qcow2

VM_WAIT_DOCKER="until [ -S /var/run/docker.sock ]; do sleep 1; done"

BENCH="/home/samplingfm/Benchmarks/FeatureModels/XSEngine.cnf /home/samplingfm/Benchmarks/FeatureModels/viper.cnf /home/samplingfm/Benchmarks/FeatureModels/phycore.cnf /home/samplingfm/Benchmarks/FeatureModels/cq7708.cnf /home/samplingfm/Benchmarks/FeatureModels/psim.cnf /home/samplingfm/Benchmarks/FeatureModels/aeb.cnf /home/samplingfm/Benchmarks/FeatureModels/sh7708.cnf /home/samplingfm/Benchmarks/FeatureModels/vrc4375.cnf /home/samplingfm/Benchmarks/FeatureModels/malta_mips32_4kc.cnf /home/samplingfm/Benchmarks/FeatureModels/rattler.cnf /home/samplingfm/Benchmarks/FeatureModels/asb2305.cnf /home/samplingfm/Benchmarks/FeatureModels/pc_usb_d12.cnf /home/samplingfm/Benchmarks/FeatureModels/vads.cnf /home/samplingfm/Benchmarks/FeatureModels/calm32_ceb.cnf /home/samplingfm/Benchmarks/FeatureModels/se77x9.cnf /home/samplingfm/Benchmarks/FeatureModels/se7751.cnf /home/samplingfm/Benchmarks/FeatureModels/mb93093.cnf /home/samplingfm/Benchmarks/FeatureModels/sparc_erc32.cnf /home/samplingfm/Benchmarks/FeatureModels/lpcmt.cnf /home/samplingfm/Benchmarks/FeatureModels/vrc4373.cnf /home/samplingfm/Benchmarks/FeatureModels/integrator_arm7.cnf /home/samplingfm/Benchmarks/FeatureModels/eb55.cnf /home/samplingfm/Benchmarks/FeatureModels/ec555.cnf /home/samplingfm/Benchmarks/FeatureModels/sh4_202_md.cnf /home/samplingfm/Benchmarks/FeatureModels/mb93091.cnf /home/samplingfm/Benchmarks/FeatureModels/atlas_mips64_5kc.cnf /home/samplingfm/Benchmarks/FeatureModels/eb42.cnf /home/samplingfm/Benchmarks/FeatureModels/ea2468.cnf /home/samplingfm/Benchmarks/FeatureModels/cma230.cnf /home/samplingfm/Benchmarks/FeatureModels/sparc_leon.cnf /home/samplingfm/Benchmarks/FeatureModels/olpch2294.cnf /home/samplingfm/Benchmarks/FeatureModels/dreamcast.cnf /home/samplingfm/Benchmarks/FeatureModels/excalibur_arm9.cnf /home/samplingfm/Benchmarks/FeatureModels/frv400.cnf /home/samplingfm/Benchmarks/FeatureModels/ipaq.cnf /home/samplingfm/Benchmarks/FeatureModels/nano.cnf /home/samplingfm/Benchmarks/FeatureModels/stm3210e_eval.cnf /home/samplingfm/Benchmarks/FeatureModels/aki3068net.cnf /home/samplingfm/Benchmarks/FeatureModels/integrator_arm9.cnf /home/samplingfm/Benchmarks/FeatureModels/mac7100evb.cnf /home/samplingfm/Benchmarks/FeatureModels/p2106.cnf /home/samplingfm/Benchmarks/FeatureModels/prpmc1100.cnf /home/samplingfm/Benchmarks/FeatureModels/sparclite_sim.cnf /home/samplingfm/Benchmarks/FeatureModels/edb7xxx.cnf /home/samplingfm/Benchmarks/FeatureModels/eb40.cnf /home/samplingfm/Benchmarks/FeatureModels/stb.cnf /home/samplingfm/Benchmarks/FeatureModels/h8300h_sim.cnf /home/samplingfm/Benchmarks/FeatureModels/skmb91302.cnf /home/samplingfm/Benchmarks/FeatureModels/ixdp425.cnf /home/samplingfm/Benchmarks/FeatureModels/grg.cnf /home/samplingfm/Benchmarks/FeatureModels/h8s_sim.cnf /home/samplingfm/Benchmarks/FeatureModels/eb40a.cnf /home/samplingfm/Benchmarks/FeatureModels/sleb.cnf /home/samplingfm/Benchmarks/FeatureModels/jmr3904.cnf /home/samplingfm/Benchmarks/FeatureModels/jtst.cnf /home/samplingfm/Benchmarks/FeatureModels/pc_i82559.cnf /home/samplingfm/Benchmarks/FeatureModels/cq7750.cnf /home/samplingfm/Benchmarks/FeatureModels/mace1.cnf /home/samplingfm/Benchmarks/FeatureModels/ref4955.cnf /home/samplingfm/Benchmarks/FeatureModels/m5272c3.cnf /home/samplingfm/Benchmarks/FeatureModels/gps4020.cnf /home/samplingfm/Benchmarks/FeatureModels/mbx.cnf /home/samplingfm/Benchmarks/FeatureModels/atlas_mips32_4kc.cnf /home/samplingfm/Benchmarks/FeatureModels/ts1000.cnf /home/samplingfm/Benchmarks/FeatureModels/at91sam7sek.cnf /home/samplingfm/Benchmarks/FeatureModels/sam7ex256.cnf /home/samplingfm/Benchmarks/FeatureModels/phycore229x.cnf /home/samplingfm/Benchmarks/FeatureModels/flexanet.cnf /home/samplingfm/Benchmarks/FeatureModels/mcb2100.cnf /home/samplingfm/Benchmarks/FeatureModels/innovator.cnf /home/samplingfm/Benchmarks/FeatureModels/ocelot.cnf /home/samplingfm/Benchmarks/FeatureModels/malta_mips64_5kc.cnf /home/samplingfm/Benchmarks/FeatureModels/ts6.cnf /home/samplingfm/Benchmarks/FeatureModels/cma28x.cnf /home/samplingfm/Benchmarks/FeatureModels/aim711.cnf /home/samplingfm/Benchmarks/FeatureModels/ebsa285.cnf /home/samplingfm/Benchmarks/FeatureModels/aaed2000.cnf /home/samplingfm/Benchmarks/FeatureModels/picasso.cnf /home/samplingfm/Benchmarks/FeatureModels/olpcl2294.cnf /home/samplingfm/Benchmarks/FeatureModels/pati.cnf /home/samplingfm/Benchmarks/FeatureModels/pc_i82544.cnf /home/samplingfm/Benchmarks/FeatureModels/e7t.cnf /home/samplingfm/Benchmarks/FeatureModels/olpce2294.cnf /home/samplingfm/Benchmarks/FeatureModels/am31_sim.cnf /home/samplingfm/Benchmarks/FeatureModels/stdeval1.cnf /home/samplingfm/Benchmarks/FeatureModels/pc_rltk8139.cnf /home/samplingfm/Benchmarks/FeatureModels/adder.cnf /home/samplingfm/Benchmarks/FeatureModels/cme555.cnf /home/samplingfm/Benchmarks/FeatureModels/refidt334.cnf /home/samplingfm/Benchmarks/FeatureModels/calm16_ceb.cnf /home/samplingfm/Benchmarks/FeatureModels/pid.cnf /home/samplingfm/Benchmarks/FeatureModels/asb.cnf /home/samplingfm/Benchmarks/FeatureModels/iq80310.cnf /home/samplingfm/Benchmarks/FeatureModels/fads.cnf /home/samplingfm/Benchmarks/FeatureModels/adderII.cnf /home/samplingfm/Benchmarks/FeatureModels/cerf.cnf /home/samplingfm/Benchmarks/FeatureModels/assabet.cnf /home/samplingfm/Benchmarks/FeatureModels/iq80321.cnf /home/samplingfm/Benchmarks/FeatureModels/tx39_sim.cnf /home/samplingfm/Benchmarks/FeatureModels/sa1100mm.cnf /home/samplingfm/Benchmarks/FeatureModels/npwr.cnf /home/samplingfm/Benchmarks/FeatureModels/brutus.cnf /home/samplingfm/Benchmarks/FeatureModels/cerfpda.cnf /home/samplingfm/Benchmarks/FeatureModels/ceb_v850.cnf /home/samplingfm/Benchmarks/FeatureModels/mpc50.cnf /home/samplingfm/Benchmarks/FeatureModels/at91sam7xek.cnf /home/samplingfm/Benchmarks/FeatureModels/edosk2674.cnf /home/samplingfm/Benchmarks/FeatureModels/pc_vmWare.cnf /home/samplingfm/Benchmarks/FeatureModels/csb281.cnf /home/samplingfm/Benchmarks/FeatureModels/uE250.cnf /home/samplingfm/Benchmarks/FeatureModels/moab.cnf /home/samplingfm/Benchmarks/FeatureModels/h8max.cnf /home/samplingfm/Benchmarks/FeatureModels/smdk2410.cnf /home/samplingfm/Benchmarks/FeatureModels/snds.cnf /home/samplingfm/Benchmarks/FeatureModels/linux.cnf /home/samplingfm/Benchmarks/FeatureModels/hs7729pci.cnf /home/samplingfm/Benchmarks/FMEasy/coreboot.cnf /home/samplingfm/Benchmarks/FMEasy/2.6.32-2var.cnf /home/samplingfm/Benchmarks/FMEasy/freebsd-icse11.cnf /home/samplingfm/Benchmarks/FMEasy/2.6.33.3-2var.cnf /home/samplingfm/Benchmarks/FMEasy/embtoolkit.cnf /home/samplingfm/Benchmarks/FMEasy/freetz.cnf /home/samplingfm/Benchmarks/FMEasy/buildroot.cnf /home/samplingfm/Benchmarks/FMEasy/2.6.28.6-icse11.cnf /home/samplingfm/Benchmarks/FMEasy/busybox-1.18.0.cnf /home/samplingfm/Benchmarks/FMEasy/ecos-icse11.cnf /home/samplingfm/Benchmarks/FMEasy/uClinux-config.cnf"
VM_CMD="docker run -v /mnt/srv/tempdd/macher/usampling-exp/:/home/usampling-exp:z macher/usampling:squashed /bin/bash -c 'cd /home/usampling-exp/; echo STARTING; python3 usampling-experiments.py --unigen3 -t 677 -flas $BENCH; echo END'"
gvirt exec $VM_NAME "$VM_WAIT_DOCKER"
gvirt exec $VM_NAME "$VM_CMD"
