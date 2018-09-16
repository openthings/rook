# Upgrade Rook to 0.8.1
# Ref: https://rook.io/docs/rook/v0.8/upgrade-patch.html

# Operator
kubectl -n rook-ceph-system set image deploy/rook-ceph-operator rook-ceph-operator=rook/ceph:v0.8.1

# Monitors
kubectl -n rook-ceph set image replicaset/rook-ceph-mon0 rook-ceph-mon=rook/ceph:v0.8.1
kubectl -n rook-ceph delete pod -l mon=rook-ceph-mon0

# OSD will automatic uopdate by operator.

# Ceph Manager
kubectl -n rook-ceph set image deploy/rook-ceph-mgr-a rook-ceph-mgr-a=rook/ceph:v0.8.1

# Object Storage (RGW)
kubectl -n rook-ceph set image deploy/rook-ceph-rgw-my-store rook-ceph-rgw-my-store=rook/ceph:v0.8.1

# Shared File System (MDS)
kubectl -n rook-ceph set image deploy/rook-ceph-mds-myfs rook-ceph-mds-myfs=rook/ceph:v0.8.1

