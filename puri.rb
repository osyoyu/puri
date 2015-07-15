require 'wav-file'
require_relative 'fft.rb'

f = open("./sounds/make_it-15.wav")
format     = WavFile::readFormat(f)
data_chunk = WavFile::readDataChunk(f)
f.close

data = data_chunk.data.unpack("c*")

# pad data_chunk with zeros so data_chunk.length
n = 2
n = n * 2 until n >= data.length
data += Array.new(n - data.length, 0)

ffter = Puri::FFT.new(data.size, 44100)
fft = ffter.fft(data)
