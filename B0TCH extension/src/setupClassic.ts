import { MonacoEditorLanguageClientWrapper, UserConfig } from 'monaco-editor-wrapper';
import { configureWorker, defineUserServices } from './setupCommon.js';
import monarchSyntax from "./syntaxes/b-0-tch.monarch.js";
import { setup } from './web/setup.js';

export const setupConfigClassic = (): UserConfig => {
    return {
        wrapperConfig: {
            serviceConfig: defineUserServices(),
            editorAppConfig: {
                $type: 'classic',
                languageId: 'b-0-tch',
                code: `// B0TCH is running in the web!`,
                useDiffEditor: false,
                languageExtensionConfig: { id: 'langium' },
                languageDef: monarchSyntax,
                editorOptions: {
                    'semanticHighlighting.enabled': true,
                    theme: 'vs-dark'
                }
            }
        },
        languageClientConfig: configureWorker()
    };
};

export const executeClassic = async (htmlElement: HTMLElement) => {
    const userConfig = setupConfigClassic();
    const wrapper = new MonacoEditorLanguageClientWrapper();
    await wrapper.initAndStart(userConfig, htmlElement);
    function getDocumentUri(wrapper: MonacoEditorLanguageClientWrapper): string {
        return wrapper.getModel()!.uri.toString();
    }
    
    // At the end of `executeClassic`
    const client = wrapper.getLanguageClient();
    if (!client) {
        throw new Error('Unable to obtain language client!');
    }
    
    setup(client, getDocumentUri(wrapper)); // setup function of the setup.ts file
};


