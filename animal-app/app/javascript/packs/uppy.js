import "core-js/stable";
import "regenerator-runtime/runtime";

// Import the plugins
const Uppy = require('@uppy/core')
const AwsS3Multipart = require('@uppy/aws-s3-multipart')
const Dashboard = require('@uppy/dashboard')
const GoogleDrive = require('@uppy/google-drive')
const Dropbox = require('@uppy/dropbox')
const Facebook = require('@uppy/facebook')
const Instagram = require('@uppy/instagram')
const Webcam = require('@uppy/webcam')

// And their styles (for UI plugins)
require('@uppy/core/dist/style.css')
require('@uppy/dashboard/dist/style.css')

const uppy = Uppy({
  // debug: true,
  autoProceed: false,
  // restrictions: {
  //   maxFileSize: 1000000,
  //   maxNumberOfFiles: 3,
  //   minNumberOfFiles: 2,
  //   allowedFileTypes: ['image/*', 'video/*']
  // }
})
.use(Dashboard, {
  trigger: '.UppyOpenerBtn',
  inline: false,
  target: '.DashboardContainer',
  replaceTargetContent: true,
  showProgressDetails: true,
  // note: 'Images and video only, 2–3 files, up to 1 MB',
  height: 470,
  metaFields: [
    { id: 'name', name: 'Name', placeholder: 'file name' },
    { id: 'caption', name: 'Caption', placeholder: 'describe what the image is about' }
  ],
  browserBackButtonClose: true
})
.use(GoogleDrive, { target: Dashboard, companionUrl: 'https://companion.uppy.io' })
.use(Dropbox, { target: Dashboard, companionUrl: 'https://companion.uppy.io' })
.use(Facebook, { target: Dashboard, companionUrl: 'https://companion.uppy.io' })
.use(Instagram, { target: Dashboard, companionUrl: 'https://companion.uppy.io' })
.use(Webcam, { target: Dashboard, facingMode: 'environment' })
.use(AwsS3Multipart, { companionUrl: '/' })

uppy.on('complete', result => {
  console.log('successful files:', result.successful)
  console.log('failed files:', result.failed)
})

// uppy.on('upload-success', function (file, response) {
//   var uploadedFileData = JSON.stringify({
//     id: response.uploadURL.match(/\/cache\/([^\?]+)/)[1], // extract key without prefix
//     storage: 'cache',
//     metadata: {
//       size:      file.size,
//       filename:  file.name,
//       mime_type: file.type,
//     }
//   })
//   // ...
// })