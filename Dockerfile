FROM mcr.microsoft.com/dotnet/framework/runtime


WORKDIR /users/public/downloads
COPY ./ ./
RUN ["NIPackageManager20.1.0.exe", "--passive","--accept-eulas","--prevent-reboot"]

RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "feed-add", "--name=ni-labview-2019-core-x86-en-2019-released", "https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2019-x86/19.0/released"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "feed-add", "--name=ni-labview-2019-core-x86-en-2019-released-critical", "https://download.ni.com/support/nipkg/products/ni-l/ni-labview-2019-x86/19.0/released-critical"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "update"]
RUN ["/Program Files/National Instruments/NI Package Manager/nipkg.exe", "install", "ni-labview-2019-core-x86-en", "--include-recommended", "--accept-eulas", "--yes"]
