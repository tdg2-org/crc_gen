function [crcGen,crcDet] = crcSetup(Polynomial,InitialConditions,DirectMethod,...
                                    ReflectInputBytes,ReflectChecksums,...
                                    FinalXOR,ChecksumsPerFrame)


                                    
crcGen = comm.CRCGenerator;
crcGen.Polynomial = Polynomial;
crcGen.InitialConditions = InitialConditions;
crcGen.DirectMethod = DirectMethod;
crcGen.ReflectInputBytes = ReflectInputBytes;
crcGen.ReflectChecksums = ReflectChecksums;
crcGen.FinalXOR = FinalXOR;
crcGen.ChecksumsPerFrame = ChecksumsPerFrame;


crcDet = comm.CRCDetector;
crcDet.Polynomial = Polynomial;
crcDet.InitialConditions = InitialConditions;
crcDet.DirectMethod = DirectMethod;
crcDet.ReflectInputBytes = ReflectInputBytes;
crcDet.ReflectChecksums = ReflectChecksums;
crcDet.FinalXOR = FinalXOR;
crcDet.ChecksumsPerFrame = ChecksumsPerFrame;
                                    