from allauth.account.forms import SignupForm
from django import forms
from django.utils.translation import gettext_lazy as _
from .models import CustomUser

class CustomSignupForm(SignupForm):
    email = forms.EmailField(
        label=_("Email"),
        required=True,
        widget=forms.EmailInput(attrs={"placeholder": _("Email address")})
    )
    password1 = forms.CharField(
        label=_("Password"),
        required=True,
        widget=forms.PasswordInput(attrs={"placeholder": _("Password")})
    )
    password2 = forms.CharField(
        label=_("Password (again)"),
        required=True,
        widget=forms.PasswordInput(attrs={"placeholder": _("Password (again)")})
    )
    role = forms.ChoiceField(
        choices=CustomUser.ROLE_CHOICES,
        widget=forms.RadioSelect,
        label=_('I want to register as'),
        required=True
    )

    def save(self, request):
        user = super().save(request)
        user.role = self.cleaned_data['role']
        user.save()
        return user 