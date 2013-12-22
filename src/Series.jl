module Series

using Datetime

import Base.show,
       Base.isless

export SeriesPair, 
       SeriesArray, 
       readseries, 
       removenan, 
       head, tail, first, last,
       @series, 
       @prettyseries
  
abstract AbstractSeriesPair

immutable SeriesPair{T, V} <: AbstractSeriesPair
  index::T
  value::V
  name::String
end

SeriesPair{T,V}(x::T,y::V) = SeriesPair{T,V}(x::T,y::V,"value")

#################################
###### isless ###################
#################################

function isless(sp1::SeriesPair, sp2::SeriesPair)
  a, b = sp1.index, sp2.index
  if !isequal(a, b)
   return isless(a, b)
  end
end

#################################
###### show #####################
#################################

function show(io::IO, p::SeriesPair)
   #print(io, p.index, "  |  ", join([@sprintf("%.4f",x) for x in p.value]," "))
   #spc = repeat(" ", length(sprint(showcompact, p.index)) + 2)
   #println(spc,  p.name)
   print(io, p.index, "  ",  p.value)
end

function show(io::IO, sa::Array{SeriesPair, 1})
  print(io, "foo")
end

#################################
###### include ##################
#################################

  include("array.jl")
  include("io.jl")
  include("../test/testmacro.jl")
  include("../test/pretty/prettytestmacro.jl")
end