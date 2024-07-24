<template>
    <div style="border: 1px solid #ccc">
      <Toolbar
        style="border-bottom: 1px solid #ccc"
        :editor="editorRef"
        :defaultConfig="toolbarConfig"
        :mode="mode"
      />
      <Editor @onChange="handleChange"
        style="height: 500px; overflow-y: hidden;"
        v-model="valueHtml"
        :defaultConfig="editorConfig"
        :mode="mode"
        @onCreated="handleCreated"
      />
    </div>
</template>

<script setup>
import { ref, shallowRef, onMounted, onBeforeUnmount } from "vue";

const editorRef = shallowRef();


// 内容 HTML
const valueHtml = ref('<p>hello</p>')

// 模拟 ajax 异步获取内容
onMounted(() => {
    setTimeout(() => {
        valueHtml.value = '<p>模拟 Ajax 异步设置内容</p>'
    }, 1500)
})

const toolbarConfig = {}
const editorConfig = { placeholder: '请输入内容...' }

const mode = ref('default');

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
    const editor = editorRef.value
    if (editor == null) return
    editor.destroy()
})

const handleCreated = (editor) => {
    editorRef.value = editor // 记录 editor 实例，重要！
}

const handleChange = (editor) => {
    console.log('change', editor.getHtml());  // 获取 html
}

// 修改 uploadImage 菜单配置
editorConfig.MENU_CONF['uploadImage'] = {
    // server: '/api/upload-image',
    fieldName: 'custom-field-name'
    // 继续写其他配置...
    
    //【注意】不需要修改的不用写，wangEditor 会去 merge 当前其他配置
}
</script>

<style lang="scss" scoped></style>