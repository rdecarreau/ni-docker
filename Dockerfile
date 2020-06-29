FROM mcr.microsoft.com/dotnet/framework/runtime

ENV NIPM_201 https://download.ni.com/support/nipkg/products/ni-package-manager/installers/NIPackageManager20.1.0.exe

WORKDIR /users/public/downloads
RUN Invoke-WebRequest $Env:NIPM_201 -OutFile 'NIPackageManager20.1.0.exe'
RUN ["NIPackageManager20.1.0.exe", "--passive","--accept-eulas","--prevent-reboot"]

RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "feed-add", "--name=ni-labview-2019-core-x86-en-2019-released", "https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2019-x86/19.0/released"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "feed-add", "--name=ni-labview-2019-core-x86-en-2019-released-critical", "https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2019-x86/19.0/released-critical"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "update"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "install", "--accept-eulas", "--prevent-reboot", "--yes", "ni-labview-2019-core-x86-en"]; exit 0
