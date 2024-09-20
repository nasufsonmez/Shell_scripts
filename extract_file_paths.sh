#!/bin/bash
#  getting the path of all the Delphes produced single top events
#  then copy the relevant cards and cross section values.
#  Created by Nasuf Sönmez on Thursday, 8. July 2015 at 21:08.
#
#

#choose the channel
channel=tw

ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc80/Events/*_[0-9]/tag_1_delphes_events.root  > list_singletop_${channel}_mhc80
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc85/Events/*_[0-9]/tag_1_delphes_events.root  > list_singletop_${channel}_mhc85
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc90/Events/*_[0-9]/tag_1_delphes_events.root  > list_singletop_${channel}_mhc90
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc100/Events/*_[0-9]/tag_1_delphes_events.root > list_singletop_${channel}_mhc100
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc110/Events/*_[0-9]/tag_1_delphes_events.root > list_singletop_${channel}_mhc110
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc120/Events/*_[0-9]/tag_1_delphes_events.root > list_singletop_${channel}_mhc120
ls /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc130/Events/*_[0-9]/tag_1_delphes_events.root > list_singletop_${channel}_mhc130

channel=tw

tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc80/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc85/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc90/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc100/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc110/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc120/Events/*_0/tag_1_pythia.log | grep "Cross section"
tail /media/cll/92997b8f-75b2-47ba-a0d3-dd535cf7c84b/0.singletop_${channel}_mhc130/Events/*_0/tag_1_pythia.log | grep "Cross section"


cp input_signal_t2_mhc130.par input_signal_tw_mhc130.par
cp input_signal_t2_mhc120.par input_signal_tw_mhc120.par
cp input_signal_t2_mhc110.par input_signal_tw_mhc110.par
cp input_signal_t2_mhc100.par input_signal_tw_mhc100.par
cp input_signal_t2_mhc90.par input_signal_tw_mhc90.par
cp input_signal_t2_mhc85.par input_signal_tw_mhc85.par
cp input_signal_t2_mhc80.par input_signal_tw_mhc80.par
