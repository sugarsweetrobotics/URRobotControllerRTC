#!/bin/bash

context="/localhost/takahashi-Parallels-Virtual-Platform.host_cxt"
rtc="URRobotControllerRTC0.rtc"
in_pose="$context/$rtc:in_pose"
in_joint="$context/$rtc:in_joint"
mode="$context/$rtc:mode"
grip="$context/$rtc:grip"

p0="RTC.Point3D(0.0902,-0.6437,0.3808),RTC.Orientation3D(-3.0154,0.4781,0.0619)"
p1="RTC.Point3D(-0.1929,-0.6305,0.3072),RTC.Orientation3D(-2.9113,1.1439,0.0399)"
p2="RTC.Point3D(0.5338,-0.3699,0.3586),RTC.Orientation3D(2.9431,0.7792,-0.0169)"
j0="[1.5434, -1.1797, 1.207, -1.5047, -1.597, -2.8515]"
j1="[1.1094, -1.1491, 1.3715, -1.7811, -1.595, -2.8519]"
j2="[2.3783, -1.1966, 1.3288, -1.7788, -1.6285, -2.8519]"
m0=1
m1=2
m2=10
g0=0
g1=1
g2=2


echo "in_pose: $p0"
rtinject $in_pose -c "RTC.TimedPose3D({time}, RTC.Pose3D($p0))"
echo "in_pose: $p1"
rtinject $in_pose -c "RTC.TimedPose3D({time}, RTC.Pose3D($p1))"
echo "in_pose: $p2"
rtinject $in_pose -c "RTC.TimedPose3D({time}, RTC.Pose3D($p2))"

echo "in_joint: $j0"
rtinject $in_joint -c "RTC.TimedFloatSeq({time}, $j0)"
echo "in_joint: $j1"
rtinject $in_joint -c "RTC.TimedFloatSeq({time}, $j1)"
echo "in_joint: $j2"
rtinject $in_joint -c "RTC.TimedFloatSeq({time}, $j2)"

echo "mode: $m0"
rtinject $mode -c "RTC.TimedOctet({time}, $m0)"
echo "mode: $m1"
rtinject $mode -c "RTC.TimedOctet({time}, $m1)"
echo "mode: $m2"
rtinject $mode -c "RTC.TimedOctet({time}, $m2)"

echo "grip: $g0"
rtinject $grip -c "RTC.TimedOctet({time}, $g0)"
echo "grip: $g1"
rtinject $grip -c "RTC.TimedOctet({time}, $g1)"
echo "grip: $g2"
rtinject $grip -c "RTC.TimedOctet({time}, $g2)"

exit 0
