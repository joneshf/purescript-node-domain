module Node.Domain where

  import Control.Monad.Eff (Eff())

  import Node.Events (EventEmitter, Variadic)

  foreign import data DomainEff :: !
  foreign import data Domain :: *

  instance eventEmitterDomain :: EventEmitter Domain

  foreign import create
    "function create() {\n\
    \  return require('domain').create();\n\
    \}" :: forall eff. Eff (domain :: DomainEff | eff) Domain

  foreign import run
    "function run(f) {\n\
    \  return function(dom) {\n\
    \    return function() {\n\
    \      return dom.run(f);\n\
    \    }\n\
    \  }\n\
    \}" :: forall eff a
        .  Eff eff a
        -> Domain
        -> Eff (domain :: DomainEff | eff) Domain

  foreign import members
    "function members(dom) {\n\
    \  return dom.members;\n\
    \}" :: Domain -> (forall emitter. (EventEmitter emitter) => [emitter])

  foreign import add
    "function add(emitter) {\n\
    \  return function(dom) {\n\
    \    return function() {\n\
    \      return dom.add(emitter);\n\
    \    }\n\
    \  }\n\
    \}" :: forall eff emitter
        .  (EventEmitter emitter)
        => emitter
        -> Domain
        -> Eff (domain :: DomainEff | eff) Domain

  foreign import remove
    "function remove(emitter) {\n\
    \  return function(dom) {\n\
    \    return function() {\n\
    \      return dom.remove(emitter);\n\
    \    }\n\
    \  }\n\
    \}" :: forall eff emitter
        .  (EventEmitter emitter)
        => emitter
        -> Domain
        -> Eff (domain :: DomainEff | eff) Domain

  foreign import bind
    "function bind(cb) {\n\
    \  return function(dom) {\n\
    \    return function() {\n\
    \      return dom.bind(function() {\n\
    \        return cb.apply(null, [].slice.call(arguments))()\n\
    \      });\n\
    \    }\n\
    \  }\n\
    \}" :: forall eff f a
        .  (Variadic f (Eff eff a))
        => f
        -> Domain
        -> Eff (domain :: DomainEff | eff) f

  foreign import intercept
    "function intercept(cb) {\n\
    \  return function(dom) {\n\
    \    return function() {\n\
    \      return dom.intercept(function() {\n\
    \        return cb.apply(null, [].slice.call(arguments))()\n\
    \      });\n\
    \    }\n\
    \  }\n\
    \}" :: forall eff f a
        .  (Variadic f (Eff eff a))
        => f
        -> Domain
        -> Eff (domain :: DomainEff | eff) f

  foreign import enter
    "function enter(dom) {\n\
    \  return function() {\n\
    \    return dom.enter();\n\
    \  }\n\
    \}" :: forall eff a
        .  Domain
        -> Eff (domain :: DomainEff | eff) Domain

  foreign import exit
    "function exit(dom) {\n\
    \  return function() {\n\
    \    return dom.exit();\n\
    \  }\n\
    \}" :: forall eff a
        .  Domain
        -> Eff (domain :: DomainEff | eff) Domain

  foreign import dispose
    "function dispose(dom) {\n\
    \  return function() {\n\
    \    return dom.dispose();\n\
    \  }\n\
    \}" :: forall eff a
        .  Domain
        -> Eff (domain :: DomainEff | eff) Domain
