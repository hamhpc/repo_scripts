#!/bin/bash

# 
# Arguments
#
#  $1 = fedora server name  (ie fedora.domain.edu)

if [ -z "$1" ]; then 
  echo ""
  echo "Error: Please specify the fedora server name as an argument"
  echo ""
  exit
fi

#
# install drupal modules
#
drush dl -y views_bulk_operations
drush dl -y colorbox
drush dl -y date
drush dl -y datepicker
drush dl -y devel
drush dl -y entity
drush dl -y entity_view_mode
drush dl -y entityreference
drush dl -y environment_indicator
drush dl -y google_analytics
drush dl -y panels
drush dl -y libraries
drush dl -y link
drush dl -y nodequeue
drush dl -y rules
drush dl -y stage_file_proxy
drush dl -y token
drush dl -y webform
drush dl -y webform_ajax
drush dl -y webform_bonus
drush dl -y webform_to_gdoc
drush dl -y webform_workflow
drush dl -y xmlsitemap

drush dl -y views
drush dl -y ctools
drush dl -y imagemagick
drush dl -y admin_menu

# reqs from aaron smith @ CM in support of phase 1 - common, configurable theme
drush dl -y features
drush dl -y features_extra
drush dl -y strongarm

#get the bootstrap theme
drush dl -y bootstrap
drush dl -y jquery_update

##########################################################
#***we do need to enable the islandora pre-req modules ***
##########################################################
drush en -y views
drush en -y views_slideshow
drush en -y views_slideshow_cycle
# Module views_slideshow_cycle doesn't meet the requirements to be enabled.                                                                                                [error]
# You need to install the jQuery cycle plugin. 
# Create a directory in sites/all/libraries called jquery.cycle, and then copy jquery.cycle.all.min.js or jquery.cycle.all.js [error]
# into it. You can find the plugin at http://malsup.com/jquery/cycle. (Currently using jQuery Cycle Library Library required for Views Slideshow Cycle)

drush en -y views_ui
drush en -y admin_menu
drush en -y bootstrap
drush en -y jquery_update

drush en -y imagemagick
##
drush vset imagemagick_convert "/bin/convert"
drush vset image_jpeg_quality "75"
drush vset image_toolkit "imagemagick"
# no graphicsmagick enable flag var? drush -l $island vset  "$"

drush en -y libraries
# no libraries vars found

drush en -y quicktabs
drush en -y quicktabs_tabstyles
# no quicktabs vars found

#############################################################################
#***default theme settings
#############################################################################

drush en -y bootstrap
drush vset theme_default bootstrap
# NOTE: SETUPNOTE- this is (currently) specific to Williams college; ideally this would be a generic islandora-compatible theme that could be easily customized to your institution and each site/project
# drush vset theme_settings --format=json '{"toggle_logo":1,"toggle_name":0,"toggle_slogan":0,"toggle_node_user_picture":0,"toggle_comment_user_picture":0,"toggle_comment_user_verification":0,"toggle_favicon":0,"toggle_main_menu":1,"toggle_secondary_menu":1,"default_logo":1,"logo_path":"","logo_upload":"","default_favicon":1,"favicon_path":"","favicon_upload":""}'
# drush vset theme_seven_settings --format=json '{"toggle_logo":1,"toggle_name":0,"toggle_slogan":0,"toggle_node_user_picture":0,"toggle_comment_user_picture":0,"toggle_comment_user_verification":0,"toggle_favicon":1,"toggle_main_menu":1,"toggle_secondary_menu":1,"default_logo":1,"logo_path":"","logo_upload":"","default_favicon":1,"favicon_path":"","favicon_upload":""}'

# drush en -y node_export_features
drush en -y fe_block
drush en -y strongarm

#
# Now do Islandora stuff
#

#
# put stuff in sites/all/libraries
#
mkdir -p sites/all/libraries
cd sites/all/libraries
#
# Install JAIL
#
git clone https://github.com/sebarmeli/JAIL.git
#
# pdfjs
#
git clone https://github.com/mozilla/pdf.js.git
#
## videojs
# 
git clone https://github.com/videojs/video.js.git
#
# colorbox
#
https://github.com/jackmoore/colorbox/archive/1.x.zip
unzip 1.x.zip
#
# get Tuque and OS
#
git clone https://github.com/Islandora/tuque.git
#git clone https://github.com/thatcher/openseadragon.git
wget https://github.com/openseadragon/openseadragon/releases/download/v2.3.1/openseadragon-bin-2.3.1.tar.gz
tar -zxvf openseadragon-bin-2.3.1.tar.gz
rm openseadragon-bin-2.3.1.tar.gz
#
# internet book reader
#
wget https://github.com/Islandora/internet_archive_bookreader/archive/master.zip
unzip master.zip

cd ../modules

#
# Now get the Islandora Modules
#

git clone https://github.com/Islandora/islandora.git
git clone https://github.com/Islandora/islandora_solution_pack_audio.git
git clone https://github.com/Islandora/islandora_solution_pack_image.git
git clone https://github.com/Islandora/islandora_solution_pack_book.git
git clone https://github.com/Islandora/islandora_solution_pack_compound.git
git clone https://github.com/Islandora/islandora_solution_pack_collection.git
git clone https://github.com/Islandora/islandora_solution_pack_large_image.git
git clone https://github.com/Islandora/islandora_solution_pack_newspaper.git
git clone https://github.com/Islandora/islandora_solution_pack_pdf.git
git clone https://github.com/Islandora/islandora_solution_pack_video.git
git clone https://github.com/Islandora/islandora_paged_content.git
git clone https://github.com/Islandora/objective_forms.git
git clone https://github.com/Islandora/php_lib.git
git clone https://github.com/Islandora/islandora_xml_forms.git
git clone https://github.com/Islandora/islandora_fits.git
git clone https://github.com/Islandora/islandora_ip_embargo.git
git clone https://github.com/Islandora/islandora_importer.git
git clone https://github.com/Islandora/islandora_book_batch.git
git clone https://github.com/Islandora/islandora_bookmark.git
git clone https://github.com/Islandora/islandora_oai.git
git clone https://github.com/Islandora/islandora_ocr.git
git clone https://github.com/Islandora/islandora_marcxml.git
git clone https://github.com/Islandora/islandora_openseadragon.git
git clone https://github.com/Islandora/islandora_simple_workflow.git
git clone https://github.com/Islandora/internet_archive_bookreader.git
git clone https://github.com/Islandora/islandora_solr_search.git
git clone https://github.com/Islandora/islandora_solr_views.git
git clone https://github.com/Islandora/islandora_xacml_editor.git
git clone https://github.com/Islandora/islandora_solution_pack_web_archive.git
git clone https://github.com/Islandora/islandora_internet_archive_bookreader.git
git clone https://github.com/Islandora/islandora_ingest_forms.git
git clone https://github.com/Islandora/islandora_batch.git
#
git clone https://github.com/Islandora/islandora_openseadragon.git
git clone https://github.com/Islandora/islandora_pdfjs.git
git clone https://github.com/Islandora/islandora_xmlsitemap.git
git clone https://github.com/Islandora/islandora_solr_metadata.git
git clone https://github.com/Islandora/islandora_solr_facet_pages.git
git clone https://github.com/Islandora/islandora_solution_pack_entities.git
git clone https://github.com/Islandora/islandora_checksum.git
git clone https://github.com/Islandora/islandora_newspaper_batch.git
git clone https://github.com/Islandora/islandora_videojs.git
git clone https://github.com/Islandora/islandora_form_fieldpanel.git
git clone https://github.com/Islandora/islandora_usage_stats.git
git clone https://github.com/Islandora/islandora_solution_pack_disk_image.git
git clone https://github.com/Islandora/islandora_scholar.git
git clone https://github.com/Islandora/islandora_populator.git
git clone https://github.com/Islandora/islandora_checksum_checker.git
git clone https://github.com/Islandora/islandora_bagit.git


cd ../../..

#############################################################################
#***use drush vset to insert islandora credentials into the database***this evidently needs to be done BEFORE the islandora modules are enabled**
#############################################################################
drush vset islandora_base_url "http://$1:8080/fedora"
drush vset islandora_repository_pid "islandora:root"
#drush vset islandora_namespace_restriction_enforced 1

#############################################################################
#***enable islandora and other modules (plus related settings) for each individual island***
#############################################################################
drush en -y islandora

drush en -y php_lib
drush en -y objective_forms
drush en -y xml_form_api, xml_form_builder, xml_form_elements, xml_schema_api
drush en -y islandora_basic_image
drush en -y xml_forms

drush en -y islandora_audio
##
drush vset --format=json islandora_audio_viewers '{"name":{"none":"none","$default_audio_viewer":"$default_audio_viewer"},"default":"$default_audio_viewer"}'
drush vset islandora_lame_url "/usr/bin/lame"

drush en -y islandora-importer
drush en -y islandora-batch
drush en -y islandora-book-batch
# FIX NOTE: some batch stuff not enabled: "Islandora Batch", "Islandora Book Batch"
drush en -y islandora-book
##
drush vset --format=json islandora_book_ingest_derivatives '{"pdf":"pdf","image":"image","ocr":"ocr"}'
drush vset --format=json islandora_book_page_viewers '{"name":{"none":"none","islandora_openseadragon":"islandora_openseadragon"},"default":"islandora_openseadragon"}'
drush vset islandora_book_parent_book_solr_field "RELS_EXT_isMemberOf_uri_ms"
drush vset islandora_book_tesseract "/usr/local/bin/tesseract"
drush vset --format=json islandora_book_viewers '{"name":{"none":"none","islandora_internet_archive_bookreader":"islandora_internet_archive_bookreader"},"default":"islandora_internet_archive_bookreader"}'

drush en -y islandora-bookmark
# FIX NOTE: islandora-bookmark not enabled

drush en -y islandora_internet_archive_bookreader

drush en -y islandora_large_image
##
drush vset islandora_kakadu_url "/usr/bin/kdu_compress"
drush vset --format=json islandora_large_image_viewers '{"name":{"none":"none","islandora_openseadragon":"islandora_openseadragon"},"default":"islandora_openseadragon"}'
drush vset islandora_use_kakadu "1"
# FIX NOTE: default setting for viewer is NOT working

drush en -y islandora_ocr
##
drush vset islandora_ocr_solr_hocr_highlighting_field "text_nodes_HOCR_hlt"
drush vset islandora_ocr_solr_hocr_highlighting_use_fas "1"
drush vset islandora_ocr_solr_hocr_result_count "32"
drush vset islandora_ocr_tesseract "/usr/local/bin/tesseract"
drush vset --format=json islandora_ocr_tesseract_enabled_languages "{'deu-frak':'0','eng':'1','fra':'1','ita':'1','jpn':'1','por':'1','spa':'1','dan-frak':'0','deu':'0','hin':'0','ita_old':'0','rus':'0','slk-frak':'0','spa_old':'0'}"



drush en -y islandora_openseadragon

drush en -y islandora_paged_content
##
drush vset islandora_paged_content_gs "/usr/bin/gs"

drush en -y islandora_video
##
drush vset islandora_video_ffmpeg2theora_path "/usr/bin/ffmpeg2theora"
drush vset islandora_video_ffmpeg_path "/usr/bin/ffmpeg"
drush vset islandora_video_make_archive "1"
drush vset islandora_video_make_mp4_locally "1"
drush vset islandora_video_make_ogg_locally "1"
drush vset islandora_video_make_thumbnail_locally "1"
drush vset islandora_video_retain_original "1"
drush vset --format=json islandora_video_viewers '{"name":{"none":"none","islandora_videojs":"islandora_videojs"},"default":"islandora_videojs"}'


drush en -y islandora_xacml_api
drush en -y islandora_xacml_editor
drush en -y willdora
drush en -y zip_importer

drush en -y islandora_pdf
##
drush vset islandora_pdf_allow_text_upload "1"
drush vset islandora_pdf_create_fulltext "0"
drush vset islandora_pdf_path_to_pdftotext "/usr/bin/pdftotext"
drush vset islandora_pdf_preview_height "700"
drush vset islandora_pdf_preview_width "500"
drush vset islandora_pdf_thumbnail_height "200"
drush vset islandora_pdf_thumbnail_width "200"

drush en -y islandora_basic_collection

drush en -y islandora_solr
drush en -y islandora_solr_config
drush en -y islandora_solr_views
##
drush vset islandora_solr_base_filter ""
drush vset islandora_solr_base_query "*:*"
drush vset islandora_solr_base_sort ""
drush vset islandora_solr_content_model_field "RELS_EXT_hasModel_uri_ms"
drush vset islandora_solr_datastream_id_field "fedora_datastreams_ms"
drush vset islandora_solr_debug_mode "0"
drush vset islandora_solr_dismax_allowed "1"
drush vset islandora_solr_facet_max_limit "20"
drush vset islandora_solr_facet_min_limit "2"
drush vset islandora_solr_facet_soft_limit "10"
drush vset islandora_solr_limit_result_fields "1"
drush vset islandora_solr_namespace_restriction ""
drush vset islandora_solr_num_of_results "20"
drush vset islandora_solr_object_label_field "fgs_label_s"
#drush vset islandora_solr_primary_display ""
drush vset islandora_solr_primary_display_table --format=json '{"weight":{"bookmark":"0","default":"0","grid":"0","table":"0"},"default":"default","enabled":{"bookmark":0,"default":"default","grid":0,"table":0}}'
#drush vset islandora_solr_query_fields "$solr_query_fields"
drush vset islandora_solr_request_handler "standard"
drush vset islandora_solr_search_boolean "user"
drush vset islandora_solr_secondary_display --format=json '{"csv":0}'
drush vset islandora_solr_tabs__active_tab "edit-default-display-settings"
drush vset islandora_solr_url "http://$1:8091/solr"



drush vset islandora_tabs__active_tab "edit-islandora-general"


drush en -y islandora_fits
##
drush vset islandora_fits_executable_path "/usr/local/bin/fits.sh"
drush vset islandora_fits_techmd_dsid "TECHMD"

drush en -y islandora_simple_workflow

#drush en -y nice_menus
##
#drush vset nice_menus_depth_1 -1
#drush vset nice_menus_js 1
#drush vset nice_menus_menu_1 menu-institution-menu
#drush vset nice_menus_name_1 Nice menu 1
#drush vset nice_menus_number 2
#drush vset nice_menus_sf_delay 800
#drush vset nice_menus_sf_speed fast
#drush vset nice_menus_type_1 down


#drush en -y googleanalytics
##
#drush vset googleanalytics_account $googleanalytics_web_property_id
# NOTE: other google analytics settings just use the defaults

drush vset islandora_batch_java "/usr/bin/java"

#
# update drupal
#
drush pm-update
