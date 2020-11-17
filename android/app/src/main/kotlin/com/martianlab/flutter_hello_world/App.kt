package com.martianlab.flutter_hello_world

import android.app.Application
import android.content.Context
import android.util.Log
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import com.martianlab.flutter_hello_world.di.*
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.startKoin
import java.lang.ref.WeakReference

class App : Application() {

    override fun onCreate() {
        super.onCreate()
        Log.d("flutter_srv", "app onCreate")
        startKoin {
            androidLogger()
            androidContext(this@App)
            modules(appModule)
        }
    }

    companion object {
        lateinit var context: Context
        var fragmentManager : WeakReference<FragmentManager>? = null
    }
}