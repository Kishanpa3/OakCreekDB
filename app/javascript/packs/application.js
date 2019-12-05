/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import "core-js/stable";
// import "regenerator-runtime/runtime";

import "core-js/stable";
import "regenerator-runtime/runtime";

const randomstring = require('randomstring')

// Import the plugins
const Uppy = require('@uppy/core')
const Dashboard = require('@uppy/dashboard')
// const GoogleDrive = require('@uppy/google-drive')
// const Dropbox = require('@uppy/dropbox')
// const Facebook = require('@uppy/facebook')
// const Instagram = require('@uppy/instagram')
const Webcam = require('@uppy/webcam')
const AwsS3Multipart = require('@uppy/aws-s3-multipart')

// And their styles (for UI plugins)
// require('@uppy/core/dist/style.min.css')
// require('@uppy/dashboard/dist/style.min.css')
// require('@uppy/webcam/dist/style.min.css')

import '@uppy/core/dist/style.min.css'
import '@uppy/dashboard/dist/style.min.css'
import '@uppy/webcam/dist/style.min.css'

const uppy = Uppy({
  // debug: true,
  autoProceed: false,
  restrictions: {
  //   maxFileSize: 1000000,
    maxNumberOfFiles: 10,
  //   minNumberOfFiles: null,
  //   allowedFileTypes: ['image/*', 'video/*']
  }
})
.use(Dashboard, {
  trigger: '.UppyModalOpenerBtn',
  inline: false,
  target: '.DashboardContainer',
  replaceTargetContent: false,
  showProgressDetails: true,
  // note: 'Images and video only, 2–3 files, up to 1 MB',
  note: 'Up to 10 files',
  height: 470,
  metaFields: [
    { id: 'name', name: 'Name', placeholder: 'file name' },
    { id: 'caption', name: 'Caption', placeholder: 'describe what the file is about' }
  ],
  browserBackButtonClose: true,
  closeModalOnClickOutside: true,
  closeAfterFinish: false
})
// .use(GoogleDrive, { target: Dashboard, companionUrl: '/' })
// .use(Dropbox, { target: Dashboard, companionUrl: '/' })
// .use(Facebook, { target: Dashboard, companionUrl: '/' })
// .use(Instagram, { target: Dashboard, companionUrl: '/' })
.use(Webcam, { target: Dashboard, mirror: false, facingMode: 'environment' })
.use(AwsS3Multipart, { companionUrl: '/' })

//Assumes temporary Shrine S3 storage has prefix: "cache" set
uppy.on('upload-success', function (file, response) {
  var uploadedFileData = JSON.stringify({
    id: response.uploadURL.match(/\/cache\/([^\?]+)/)[1], // extract key without prefix
    storage: 'cache',
    metadata: {
      size:      file.size,
      filename:  file.name,
      mime_type: file.type,
    }
  })
  
  const hiddenField = document.createElement('input')
  hiddenField.className = "upload-hidden"
  
  hiddenField.type = 'hidden'
  hiddenField.name = `animal[documents_attributes][${randomstring.generate()}][file]`
  hiddenField.value = uploadedFileData

  document.querySelector('form').appendChild(hiddenField)
  
  // You could submit one form for each individual file, but that would use much more requests
  // document.getElementById("form-uppy").submit();
  // document.getElementsByClassName("upload-hidden").remove();
  
  // // set hidden field value to the uploaded file data so that it's submitted with the form as the attachment
  // var hiddenInput = document.querySelector('.upload-hidden')
  // hiddenInput.value = uploadedFileData
})

uppy.on('complete', result => {
  document.getElementById("form-uppy").submit();
  
  // Clear form input child elements after form submission
  var elements = document.getElementById("form-uppy")
                   .getElementsByClassName("upload-hidden");
  while (elements.length > 0) {
    elements[0].parentNode.removeChild(elements[0]);
  }
  
  console.log('successful files:', result.successful)
  console.log('failed files:', result.failed)
})