# Protected Face Templates Generation Based on Multiple Partial Walsh Transformations and Simhash
by Ce Gao; Kang Zhang; Weiwei Wang; Zhicheng Cao; Liaojun Pang; Eryun Liu; Heng Zhao
## Abstract
With the widespread application of biometric, unprotected biometric data is still at risk of serious security and privacy breaches. When large amounts of unprotected biometric data leak, cancelable biometric become a powerfully remedial measure. In this paper, we propose a new method to generate stable and cancelable face templates based on multiple partial Walsh transformations (MPWT) and Simhash. Firstly, multiple partial Walsh matrices generated with random external parameters perform projection transformation on the original real-valued face features, ensuring the irreversibility and unlinkability of the system. Subsequently, the projected features are transformed into discrete binary codes (protected templates) using Simhash. And the random permutation seed ensures the revocability of generated protected template. Furtherly, the protected templates have small storage space and is more suitable for fast comparison but also yields improvements in recognition accuracy compared with several state-of-the-arts. Numerous experiments on CASIA-WebFace, LFW, FEI, and Color FERET databases show that the protected templates are nearly identical to the unprotected ones in the comparison performance. The scheme also meets the requirements of non-invertibility, revocability, unlinkability, as well as resistance for various types of attacks like attacks via record multiplicity, false accepts, brute force and pre-image. Therefore, the proposed methodology strikes a balance between recognition accuracy and security.
## Implementation of our paper: Simhash
How to Run: 
1.Create folder of Simhash and subfolder of data,Gscore, Iscore, BINCODE and Result.
2.Run Simhash.m to get the EER of the proposed method. Note that, EERs are obtained by calculating the average of the EERs repeated five times because the multiple partial Walsh projection is applied.
## Citation
```
@ARTICLE{10444633,
  author={Gao, Ce and Zhang, Kang and Wang, Weiwei and Cao, Zhicheng and Pang, Liaojun and Liu, Eryun and Zhao, Heng},
  journal={IEEE Transactions on Information Forensics and Security}, 
  title={Protected Face Templates Generation Based on Multiple Partial Walsh Transformations and Simhash}, 
  year={2024},
  volume={},
  number={},
  pages={1-1},
  keywords={Biometrics (access control);Face recognition;Security;Vectors;Privacy;Iris recognition;Fingerprint recognition;Biometric;face template protection;multiple partial Walsh transformations;Simhash;security and privacy},
  doi={10.1109/TIFS.2024.3369322}}
```
