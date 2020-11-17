package com.martianlab.flutter_hello_world.presentation

import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import androidx.annotation.NonNull
import androidx.fragment.app.viewModels
import com.martianlab.recipes.domain.RecipesInteractor
import com.martianlab.recipes.entities.Recipe
import com.martianlab.recipes.entities.RecipeComplexity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject

class MainActivity: FlutterActivity(), CoroutineScope by CoroutineScope(Dispatchers.Main) {

    private val CHANNEL = "recipes/platform"

    private val interactor: RecipesInteractor by inject()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        println("flutter_srv: "+ "onCreate()")
        //GlobalScope.launch {
        //    interactor.firstLaunchCheck()
        //}
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "firstLaunchCheck" -> {
                    firstLaunchCheck(call, result)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun firstLaunchCheck(call: MethodCall, result: MethodChannel.Result) {
        // get arguments from call
        //val url = call.argument<String>("url") ?: ""
        launch {
            try {
                interactor?.firstLaunchCheck()
                result.success(true)
            } catch (e: Exception) {
                result.error("N/A",
                        "Error during firstLaunchCheck().",
                        e.localizedMessage)
            }
        }
    }


}
