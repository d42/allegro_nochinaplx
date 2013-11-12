fagets = [
    "antonhrechuhin1",
    "lensenltd",
    "orion1695",
    "ClothingBiZI",
    "_CT_",
    "SaRnA-TW",
    "tomigood",
    "simnok",
    "Depape",
    "itb-uk", #TODO: should we ban europe as well
    "221088",
    "asiaeco",
    "InvecoyLTD",
    "vordon110",
    "GSM-Connect",
    "two7selling",
    "two6selling",
    "two8selling",
    "abc_sklepik",
    "SEBA1-S1",
    "szkielu",
    "www_droptrend_co",
    "fenrir85",
    "SaRnA-TW",
    "hiszpaneverlast",
    "pawlo4444",
    "oneselling",
    "MediaTechnology1",
    "etblhk",
    "Roosko"
]

get_name_from_ajax = (ajax) ->
    wrapper = document.createElement("div")
    wrapper.innerHTML = ajax
    name = wrapper.getElementsByTagName("a")[0].text # TODO: shouldn't I do some cleanup up here?
    return name

do_stuff = ->
    itemData = {}
    pagerLimit = window.jQuery("#listing .listing-options-bottom .items-per-page .current").text()
    getAjax = "/Listing/AdditionalData.php/getAjax"

    ajax_success = (response) ->
        for id, data of response.data
            name = get_name_from_ajax(data.s.link)
            if name in fagets
                window.jQuery("#item-" + id).remove()

    window.jQuery("#listing .offer").each(->
            offer = window.jQuery(this)
            itemData[offer.data("id")] = offer.find(".photo").data("popup")
    )
    token = window.jQuery("#listing").data("popup").token

    window.jQuery.ajax
        url: getAjax
        data:
            items: itemData
            token: token
            pagerLimit: pagerLimit
        type: "post"
        #async: false
        dataType: "json"
        success: ajax_success




window.addEventListener "DOMContentLoaded", ->
    do_stuff()
