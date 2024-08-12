<template>
    <div ref="divRef" style="height: 600px" />
    <button type="button" class="btn btn-primary btn-lg" @click="getContent">click</button>
</template>

<script setup lang="ts">
import { AiEditor } from "aieditor";
import "aieditor/dist/style.css"
import { onMounted, onUnmounted, ref, watch } from "vue";
import { uploadAPI, adminAPI } from "@/assets/JS/function";

const divRef = ref();
let aiEditor: AiEditor | null = null;

onMounted(() => {
    aiEditor = new AiEditor({
        element: divRef.value as Element,
        placeholder: "Click to Input Content...",
        content: 'AiEditor is an Open Source Rich Text Editor Designed for AI. ',
        image:{
            uploadUrl: adminAPI('upload', 'upload'),
            uploader: (file, uploadUrl, headers, formName) => {
                console.log(file, uploadUrl, headers, formName);

                
            const formData = new FormData();
            formData.append(formName, file);

            console.log(formData);
            
            return new Promise((resolve, reject) => {
                fetch(uploadUrl, {
                    method: "post",
                    headers: {'Accept': 'application/json', ...headers},
                    body: formData,
                }).then((resp) => resp.json())
                    .then(json => {
                        console.log(json);
                        
                        resolve(json);
                    }).catch((error) => {
                    console.log(error);
                    reject(error);
                })
                
            });
        }
        }
    })
})

onUnmounted(() => {
    aiEditor && aiEditor.destroy();
})

const content = ref("");
function getContent() {
    console.log(aiEditor.getHtml());
}
</script>