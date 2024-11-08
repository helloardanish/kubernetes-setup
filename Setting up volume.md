## Setting up volume in kubernetes


#### Step 1: Define a PersistentVolume to represent the storage in your cluster:

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: centos-local-pv
spec:
  capacity:
    storage: 10Gi    # Specify storage size
  accessModes:
    - ReadWriteOnce  # Choose an access mode suitable for your application
  hostPath:
    path: /mnt/data   # Path on the host node where data will be stored
```

#### Step 2: Create a PersistentVolumeClaim that the pod will use to access the storage:

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: centos-local-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi   # Must match the PV size
```


#### Step 3: Update the Pod Definition to Use the Volume:

```
apiVersion: v1
kind: Pod
metadata:
  name: centos-staging-pod
  labels:
    app: centos-staging
spec:
  containers:
    - name: centos-staging-container
      image: centos:7.9.2009
      ports:
        - containerPort: 8080
        - containerPort: 8081
        - containerPort: 8082
        - containerPort: 8083
      command:
        - /bin/bash
        - -c
        - |
          echo "CentOS pod is running"
          tail -f /dev/null  # Keeps the container running for manual intervention
      resources:
        requests:
          memory: "4Gi"
          cpu: "4"
        limits:
          memory: "8Gi"
          cpu: "8"
      volumeMounts:
        - mountPath: /home/data    # Path inside the container where the volume is mounted
          name: local-storage      # Refers to the volume name defined below
  volumes:
    - name: local-storage
      persistentVolumeClaim:
        claimName: centos-local-pvc  # Reference to the PVC created above

```



#### Summary
1. PersistentVolume: Creates the physical storage resource.
2. PersistentVolumeClaim: Requests storage from the PV.
3. Pod Definition: Mounts the PVC as a volume.
4. Apply each configuration file (e.g., kubectl apply -f <filename.yaml>), starting with the PersistentVolume, then the PersistentVolumeClaim, and finally the Pod. This setup ensures that the specified folder (/home/data) will retain data across restarts.

