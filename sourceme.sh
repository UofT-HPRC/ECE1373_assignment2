source /opt/Xilinx/Vivado/2017.2/settings64.sh
source /opt/util/sourceme.sh
export CAFFE_ROOT=/opt/caffe
export PYCAFFE_ROOT=$CAFFE_ROOT/python
export PYTHONPATH=$PYCAFFE_ROOT:$PYTHONPATH
export PATH=$CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
export XILINXD_LICENSE_FILE=27012@mlm.ece.utoronto.ca:40012@mlm.ece.utoronto.ca
