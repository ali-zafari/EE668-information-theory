load('re_joint_entropy.mat')
load('re_entrop.mat')

full_joint = tril(JointEntropy, -1) + JointEntropy';
mutualinf = entrop + entrop' - full_joint';

imagesc(mutualinf)
colorbar