library(scatterplot3d)
attach(StudentsPerformance)
scatterplot3d(`math score`,`reading score`,`writing score` , main = "3D Scatterplot of Student Performace in Math,Reading & Writing Scores")
