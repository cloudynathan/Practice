###### Apply family ######

#apply
a <- c(1,2,3,4)
b<- c(1,1,1,1)
d<-c(2,2,2,2)
mtx <- matrix(c(1,2,3,4,1,1,1,1,2,2,2,2),nrow=3,ncol=4,byrow=TRUE)
apply(mtx,1,sum)

#apply to array
mtx1 <- matrix(c(1,1,1,2,2,2,3,3,3),nrow=3,ncol=3,byrow=TRUE)
mtx2 <- matrix(c(4,4,4,5,5,5,6,6,6),nrow=3,ncol=3,byrow=TRUE)
mtx3 <- matrix(c(7,7,7,8,8,8,9,9,9),nrow=3,ncol=3,byrow=TRUE)
a <- array(c(mtx1, mtx2, mtx3), dim = c(3,3,3))
apply(a, MARGIN=1, FUN=sum)

#lapply(list|df|vector, function)
a <- c(1,2,3,4)
b<- c(1,1,1,1)
d<-c(2,2,2,2)
l <- list(a,b,d)
lapply(l,mean)

#sapply(vector|df|list, function)
calist <- list(diet1=c(1,1,1), diet2=c(3,3,3), diet3=c(8,8,8))
sapply(calist,mean)

#tapply(vector|column of a df|element of a list, index, function)
patient <- 1:6
age<-c(20,25,30,55,72,60)
tx <- c("a","b","c","a","b","c")
tapply(age,tx,mean)

#rapply(list, function, how)
l <- list(c(1,2,3,4,5), c(2,3,4,5,6))
rapply(l, sum)

#vapply(list, function, FUN.VALUE = type, ...)
a <- c(1,2,3,4)
b<- c(1,1,1,1)
l<-list(a,b)
vapply(l,summary,FUN.VALUE = c(numeric(1),
                               numeric(1),
                               numeric(1),
                               numeric(1),
                               numeric(1),
                               numeric(1)))

#eapply(env, FUN)
myenv=new.env()
myenv$a=c(1,2,3,4,5)
eapply(myenv,sum)

#mapply(FUN,...)
a <- c(1,2,3,4)
b<- c(1,1,1,1)
d<-c(2,2,2,2)
l <- list(a,b,d)
mapply(sum, a,b,d)

