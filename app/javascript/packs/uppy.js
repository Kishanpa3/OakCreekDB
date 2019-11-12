import "core-js/stable";
import "regenerator-runtime/runtime";

// Import the plugins
const Uppy = require('@uppy/core')
const Dashboard = require('@uppy/dashboard')
const GoogleDrive = require('@uppy/google-drive')
const Dropbox = require('@uppy/dropbox')
const Facebook = require('@uppy/facebook')
const Instagram = require('@uppy/instagram')
const Webcam = require('@uppy/webcam')
const AwsS3Multipart = require('@uppy/aws-s3-multipart')

// And their styles (for UI plugins)
require('@uppy/core/dist/style.min.css')
require('@uppy/dashboard/dist/style.min.css')
require('@uppy/webcam/dist/style.min.css')

const uppy = Uppy({
  // debug: true,
  autoProceed: false,
  // restrictions: {
  //   maxFileSize: 1000000,
  //   maxNumberOfFiles: 10,
  //   minNumberOfFiles: null,
  //   allowedFileTypes: ['image/*', 'video/*']
  // }
})
.use(Dashboard, {
  trigger: '.UppyModalOpenerBtn',
  inline: false,
  target: '.DashboardContainer',
  replaceTargetContent: true,
  showProgressDetails: true,
  // note: 'Images and video only, 2–3 files, up to 1 MB',
  height: 650,
  metaFields: [
    { id: 'name', name: 'Name', placeholder: 'file name' },
    { id: 'caption', name: 'Caption', placeholder: 'describe what the file is about' }
  ],
  browserBackButtonClose: true
})
.use(GoogleDrive, { target: Dashboard, companionUrl: '/' })
.use(Dropbox, { target: Dashboard, companionUrl: 'https://companion.uppy.io' })
.use(Facebook, { target: Dashboard, companionUrl: '/' })
.use(Instagram, { target: Dashboard, companionUrl: '/' })
.use(Webcam, { target: Dashboard, facingMode: 'environment' })
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
  // ...
})

uppy.on('complete', result => {
  console.log('successful files:', result.successful)
  console.log('failed files:', result.failed)
})