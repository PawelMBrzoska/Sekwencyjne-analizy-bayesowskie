library(BFDA)

Effect.00 <- BFDA.sim(expected.ES=0.00, type="t.between",
                    prior=list("Cauchy", list(prior.location=0, prior.scale=sqrt(2)/2)),
                    n.min=100, n.max=1000, design="sequential",  alternative="greater", boundary=12, B=1000,
                    verbose=TRUE, cores=10, stepsize = 10)

Effect.20 <- BFDA.sim(expected.ES=0.20, type="t.between",
                    prior=list("Cauchy",list(prior.location=0, prior.scale=sqrt(2)/2)),
                    n.min=100, n.max=1000, design="sequential",  alternative="greater", boundary= 12, B=1000,
                    verbose=TRUE, cores=10, stepsize = 10)

Effect.30 <- BFDA.sim(expected.ES=0.30, type="t.between",
                      prior=list("Cauchy",list(prior.location=0, prior.scale=sqrt(2)/2)),
                      n.min=100, n.max=1000, design="sequential",  alternative="greater", boundary= 12, B=1000,
                      verbose=TRUE, cores=10, stepsize = 10)

Effect.50 <- BFDA.sim(expected.ES=0.50, type="t.between",
                      prior=list("Cauchy",list(prior.location=0, prior.scale=sqrt(2)/2)),
                      n.min=100, n.max=1000, design="sequential",  alternative="greater", boundary= 12, B=1000,
                      verbose=TRUE, cores=10, stepsize = 10)



BFDA.analyze(Effect.00, design="sequential", n.min=100, n.max=1000, boundary=c(1/12, 12))
plot(Effect.00, n.min=100, n.max = 1000, boundary=c(1/12, 12), n.trajectories = 100)

BFDA.analyze(Effect.30, design="sequential", n.min=100, n.max=1000, boundary=c(1/12, 12))
plot(Effect.30, n.min=100, n.max = 1000, boundary=c(1/12, 12), n.trajectories = 100)

BFDA.analyze(Effect.50, design="sequential", n.min=100, n.max=1000, boundary=c(1/12, 12))
plot(Effect.50, n.min=100, n.max = 1000, boundary=c(1/12, 12), n.trajectories = 100)

BFDA.analyze(Effect.00, design="sequential", n.min=100, n.max=1000, boundary=c(1/6, 6))
plot(Effect.00, n.min=100, n.max = 1000, boundary=c(1/6, 6), n.trajectories = 100)

BFDA.analyze(Effect.00, design="sequential", n.min=100, n.max=1000, boundary=c(1/6, 6))
plot(Effect.00, n.min=500, n.max = 1000, boundary=c(1/6, 6), n.trajectories = 100)

BFDA.analyze(Effect.20, design="sequential", n.min=100, n.max=1000, boundary=c(1/12, 12))
plot(Effect.20, n.min=100, n.max = 1000, boundary=c(1/12, 12), n.trajectories = 100)

BFDA.analyze(Effect.20, design="sequential", n.min=100, n.max=1000, boundary=c(1/6, 6))
plot(Effect.20, n.min=100, n.max = 1000, boundary=c(1/6, 6), n.trajectories = 100)
