from django import template

register = template.Library()


@register.filter
def suchsplit(val):
    splist=val.split('&')
    if 'models=case.case' in splist and 'models=product.product' in splist:
        return 'choice all'
    elif 'models=case.case' in splist and 'models=product.product' not in splist:
        return 'choice case'
    elif 'models=case.case' not in splist and 'models=product.product' in splist:
        return 'choice product'
    else:
        return 'no choice'

