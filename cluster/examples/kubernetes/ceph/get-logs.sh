(for p in $(kubectl -n rook-ceph get pods -o jsonpath='{.items[*].metadata.name}')
do
    for c in $(kubectl -n rook-ceph get pod ${p} -o jsonpath='{.spec.containers[*].name}')
    do
        echo "BEGIN logs from pod: ${p} ${c}"
        kubectl -n rook-ceph logs -c ${c} ${p}
        echo "END logs from pod: ${p} ${c}"
    done
done
for i in $(kubectl -n rook-ceph-system get pods -o jsonpath='{.items[*].metadata.name}')
do
    echo "BEGIN logs from pod: ${i}"
    kubectl -n rook-ceph-system logs ${i}
    echo "END logs from pod: ${i}"
done) | gzip > /tmp/rook-logs.gz

