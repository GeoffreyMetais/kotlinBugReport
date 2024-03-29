-optimizationpasses 5
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-dontobfuscate
-dontpreverify
-dontwarn **
-verbose
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*,!code/allocation/variable

# Do not optimize/shrink LibVLC, because of native code
-keep class org.videolan.libvlc.** { *; }
# Same for MediaLibrary
-keep class org.videolan.medialibrary.** { *; }

-keep public class * extends android.app.Activity {
    public <methods>;
}
-keep public class * extends android.app.Fragment {
    public <methods>;
}
-keep public class * extends androidx.fragment.app.Fragment {
    public <methods>;
}
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService

# Samsung shit workaround
# see https://code.google.com/p/android/issues/detail?id=78377
# see also: https://code.google.com/p/android/issues/detail?id=78377#c322
-keepattributes **
-keep class !android.support.v7.view.menu.**,!android.support.design.internal.NavigationMenu,!android.support.design.internal.NavigationMenuPresenter,!android.support.design.internal.NavigationSubMenu, android.support.** {*;}

-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}

# support design
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }

-dontwarn android.support.**

# Kotlinx
-keep class kotlinx.coroutines.internal.MainDispatcherFactory { *; }
-keep class kotlinx.coroutines.android.AndroidExceptionPreHandler { *; }
-keep class kotlinx.coroutines.android.AndroidDispatcherFactory { *; }

# Retrofit
# Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
# EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod

# Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations

# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**

# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit

# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.-KotlinExtensions

-keep class com.google.android.material.** { *; }
