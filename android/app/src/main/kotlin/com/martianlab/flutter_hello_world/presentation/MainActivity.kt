package com.martianlab.flutter_hello_world.presentation

import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import androidx.fragment.app.viewModels
import com.martianlab.recipes.domain.RecipesInteractor
import com.martianlab.recipes.entities.Recipe
import com.martianlab.recipes.entities.RecipeComplexity
import io.flutter.embedding.android.FlutterActivity
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject

class MainActivity: FlutterActivity() {

    private val interactor: RecipesInteractor by inject()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        println("flutter_srv: "+ "onCreate()")
        GlobalScope.launch {
            interactor.firstLaunchCheck()
        }
    }
}
