"delete-vm-libs.st"

| libsToKeep libs libsToDelete |

libsToKeep := 'libB2DPlugin.so
libBitBltPlugin.so
libDSAPrims.so
libFileAttributesPlugin.so
libFilePlugin.so
libFloatArrayPlugin.so
libJPEGReadWriter2Plugin.so
libJPEGReaderPlugin.so
libLargeIntegers.so
libLocalePlugin.so
libMiscPrimitivePlugin.so
libPharoVMCore.so
libSocketPlugin.so
libSqueakSSL.so
libSurfacePlugin.so
libTestLibrary.so
libUUIDPlugin.so
libUnixOSProcessPlugin.so
libcrypto.so
libexpat.so
libffi.so
libgit2.so
libssh2.so
libssl.so
libtty.so
libz.so' lines collect: #trimBoth.

libs := FileLocator vmDirectory childrenMatching: '*.so*'.

libsToDelete := libs reject: [ :lib | libsToKeep includes: lib basename ].

libsToDelete do: [ :each |
    ('rm ' , each pathString) traceCr.
    each delete ].
