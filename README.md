# Module Documentation

## Module Node.Domain

### Types

    data Domain :: *

    data DomainEff :: !


### Type Class Instances

    instance eventEmitterDomain :: EventEmitter Domain


### Values

    add :: forall eff emitter. (EventEmitter emitter) => emitter -> Domain -> Eff (domain :: DomainEff | eff) Domain

    bind :: forall eff f a. (Variadic f (Eff eff a)) => f -> Domain -> Eff (domain :: DomainEff | eff) f

    create :: forall eff. Eff (domain :: DomainEff | eff) Domain

    dispose :: forall eff a. Domain -> Eff (domain :: DomainEff | eff) Domain

    enter :: forall eff a. Domain -> Eff (domain :: DomainEff | eff) Domain

    exit :: forall eff a. Domain -> Eff (domain :: DomainEff | eff) Domain

    intercept :: forall eff f a. (Variadic f (Eff eff a)) => f -> Domain -> Eff (domain :: DomainEff | eff) f

    members :: Domain -> (forall emitter. (EventEmitter emitter) => [emitter])

    remove :: forall eff emitter. (EventEmitter emitter) => emitter -> Domain -> Eff (domain :: DomainEff | eff) Domain

    run :: forall eff a. Eff eff a -> Domain -> Eff (domain :: DomainEff | eff) Domain



