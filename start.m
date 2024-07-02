clc, clear all, close all

numNodes = 100; % number of nodes
netArch  = newNetwork(200, 200, 100, 100);
nodeArch = newNodes(netArch, numNodes);
roundArch = newRound();
p=0.1;
% save Data_100.mat netArch nodeArch roundArch;
% load Data_100.mat;

plot1

par = struct;

for r = 1:roundArch.numRound
    r
    clusterModel = newCluster(netArch, nodeArch, 'leach', r,p);
    clusterModel = dissEnergyCH(clusterModel, roundArch);
    clusterModel = dissEnergyNonCH(clusterModel, roundArch);
    nodeArch     = clusterModel.nodeArch; % new node architecture after select CHs
    par = plotResults(clusterModel, r, par);
    pause(0.1);
    if nodeArch.numDead == nodeArch.numNode || r==1200
        break
    end
end
save expriment2_Leach.mat par;

