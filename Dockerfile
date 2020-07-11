FROM mcr.microsoft.com/dotnet/framework/runtime

ENV NIPM_201 https://download.ni.com/support/nipkg/products/ni-package-manager/installers/NIPackageManager20.1.0.exe
ENV LV_RELEASED https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2019-x86/19.1/released
ENV LV_PACKAGE ni-labview-2019-core-x86-en

WORKDIR /users/public/downloads
RUN powershell -Command Invoke-WebRequest $Env:NIPM_201 -OutFile 'NIPackageManager20.1.0.exe' &&\
    NIPackageManager20.1.0.exe --passive --accept-eulas --prevent-reboot &&\
    del NIPackageManager20.1.0.exe


WORKDIR "/Program Files/National Instruments/NI Package Manager"

RUN nipkg.exe feed-add --name=ni-labview-2019-core-x86-en-2019-released %LV_RELEASED% &&\
    nipkg.exe update
RUN nipkg.exe install --passive --accept-eulas --yes ni-labview-2019-core-x86-en & exit 0
RUN nipkg.exe install --passive --accept-eulas --yes ni-labview-command-line-interface-x86

WORKDIR "/Program Files (x86)/National Instruments/LabVIEW 2019"
COPY labview.ini LabVIEW.ini