package com.martianlab.flutter_hello_world.routing

import androidx.fragment.app.FragmentManager
import com.martianlab.recipes.domain.api.RoutingApi
import com.martianlab.recipes.entities.Destination


class RouterImpl constructor(
    private val fragmentManager: FragmentManager?
) : RoutingApi {

    override fun goTo(destination: Destination) {

        fragmentManager?.let {
        }

    }

    override fun goBack() {
        fragmentManager?.popBackStack()
    }
}