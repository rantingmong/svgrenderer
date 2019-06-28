#include "StyleStack.hpp"

#include <utki/debug.hpp>

using namespace svgdom;


const svgdom::StyleValue* StyleStack::getStyleProperty(svgdom::StyleProperty_e p)const{
	bool explicitInherit = false;

	for (auto i = this->stack.rbegin(); i != this->stack.rend(); ++i) {
		ASSERT(*i)
		auto v = (*i)->findStyleProperty(p);
		if (!v) {
			if (!explicitInherit && !svgdom::Styleable::isStylePropertyInherited(p)) {
				return nullptr;
			}
			continue;
		}
		if (v->type == svgdom::StyleValue::Type_e::INHERIT) {
			explicitInherit = true;
			continue;
		}
		return v;
	}

	return nullptr;
}

StyleStack::Push::Push(StyleStack& ss, const svgdom::Styleable& s) :
		ss(ss)
{
	this->ss.stack.push_back(&s);
}

StyleStack::Push::~Push()noexcept{
	this->ss.stack.pop_back();
}
