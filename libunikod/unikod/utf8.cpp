#include "utf8.hpp"

#include <utki/debug.hpp>

using namespace unikod;


Utf8Iterator::Utf8Iterator(const char* begin) :
		n(reinterpret_cast<const std::uint8_t*> (begin))
{
	if (this->n == 0) {
		this->c = 0;
	} else {
		this->operator++();
	}
}



Utf8Iterator& Utf8Iterator::operator++() noexcept{
	std::uint8_t b = *this->n;
	//		TRACE(<< "utf8::Iterator::operator++(): b = " << std::hex << unsigned(b) << std::endl)
	++this->n;
	if ((b & 0x80) == 0) {
		this->c = std::uint32_t(b);
		return *this;
	}

	//		TRACE(<< "utf8::Iterator::operator++(): *n = " << std::hex << unsigned(*this->n) << std::endl)

	this->c = (*this->n) & 0x3f;
	//		TRACE(<< "utf8::Iterator::operator++(): initial c = " << std::hex << c << std::endl)

	++this->n;

	unsigned i = 2;
	for (; (std::uint8_t(b << i) >> 7); ++i, ++this->n) {
		//			TRACE(<< "utf8::Iterator::operator++(): std::uint8_t(b << i) = " << std::hex << unsigned(std::uint8_t(b << i)) << std::endl)
		//			TRACE(<< "utf8::Iterator::operator++(): ((b << i) >> 7) = " << std::hex << unsigned(std::uint8_t(b << i) >> 7) << std::endl)
		//			TRACE(<< "utf8::Iterator::operator++(): *n = " << std::hex << unsigned(*this->n) << std::endl)
		this->c <<= 6;
		//			TRACE(<< "utf8::Iterator::operator++(): c = " << std::hex << c << std::endl)
		this->c |= (*this->n) & 0x3f;
		//			TRACE(<< "utf8::Iterator::operator++(): c = " << std::hex << c << std::endl)
	}
	this->c |= (char32_t(std::uint8_t(b << (i + 1)) >> (i + 1)) << (6 * (i - 1)));
	//		TRACE(<< "utf8::Iterator::operator++(): c = " << std::hex << c << std::endl)

	return *this;
}


std::u32string unikod::toUtf32(Utf8Iterator str){
	std::vector<char32_t> buf;
	for(; !str.isEnd(); ++str){
		buf.push_back(str.character());
	}
	return std::u32string(buf.begin(), buf.end());
}


std::array<char, maxSizeOfUtf8EncodedCharacter_c + 1> unikod::toUtf8(char32_t c){
	std::array<char, 7> ret;
	
	if(c <= 0x7f){
		ret[0] = char(c);
		ret[1] = 0;
		return ret;
	}
	
	unsigned numBytes;
	
	if(c <= 0x7ff){
		numBytes = 2;
	}else if(c <= 0xffff){
		numBytes = 3;
	}else if(c <= 0x1fffff){
		numBytes = 4;
	}else if(c <= 0x3ffffff){
		numBytes = 5;
	}else if(c <= 0x7fffffff){
		numBytes = 6;
	}else{
		ret[0] = 0;
		return ret;
	}
	
	switch(numBytes){
		case 1:
			ASSERT(false)
			break;
		case 2:
			ret[0] = 0xc0 | ((c >> 6) & 0x1f); // 0xc0 = 0b11000000
			ret[1] = 0x80 | (c & 0x3f);
			ret[2] = 0;
			break;
		case 3:
			ret[0] = 0xe0 | ((c >> 12) & 0xf); // 0xe0 = 0b11100000
			ret[1] = 0x80 | ((c >> 6) & 0x3f);
			ret[2] = 0x80 | (c & 0x3f);
			ret[3] = 0;
			break;
		case 4:
			ret[0] = 0xf0 | ((c >> 18) & 0x7); // 0xf0 = 0b11110000
			ret[1] = 0x80 | ((c >> 12) & 0x3f);
			ret[2] = 0x80 | ((c >> 6) & 0x3f);
			ret[3] = 0x80 | (c & 0x3f);
			ret[4] = 0;
			break;
		case 5:
			ret[0] = 0xf8 | ((c >> 24) & 0x3); // 0xf8 = 0b11111000
			ret[1] = 0x80 | ((c >> 18) & 0x3f);
			ret[2] = 0x80 | ((c >> 12) & 0x3f);
			ret[3] = 0x80 | ((c >> 6) & 0x3f);
			ret[4] = 0x80 | (c & 0x3f);
			ret[5] = 0;
			break;
		case 6:
			ret[0] = 0xfc | ((c >> 30) & 0x1); // 0xfc = 0b11111100
			ret[1] = 0x80 | ((c >> 24) & 0x3f);
			ret[2] = 0x80 | ((c >> 18) & 0x3f);
			ret[3] = 0x80 | ((c >> 12) & 0x3f);
			ret[4] = 0x80 | ((c >> 6) & 0x3f);
			ret[5] = 0x80 | (c & 0x3f);
			ret[6] = 0;
			break;
	}
	
	return ret;
}
