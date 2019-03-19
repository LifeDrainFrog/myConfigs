// setting
const fs = require('fs')
const output_filename = './README.md' 
const package_json = require('../package')
const repo_author = package_json.author
const repo_name = package_json.name

const config_list = [
  {
    name:'vimrc',emoji:':pencil2:',hl:'vim'
  },
  {
    name:'bashrc',emoji:':e-mail:',hl:'bash'
  },
  {
    name:'gitconfig',emoji:':art:',hl:''
  }
]

const travis_repo_url = `https://travis-ci.com/${repo_author}/${repo_name}`
const travis_badge_url = `https://travis-ci.com/${repo_author}/${repo_name}.svg?branch=master`

const toc_name = 'Table Of Contents'
const top_name = 'top'
const top_href= '#table-of-contents'

let load_content = filename=>{
  return fs.readFileSync(filename,'utf8')
}

let format = str => {
  return str.trim().replace(/^ +/gm,'')
}

let create_content = filename=>{
  let content = load_content( './src/'+filename ) 
  return content
}

let create_readme = ()=>{
  let res = `
# ${repo_name}

  [![build](${travis_badge_url})](${travis_repo_url})

  Some personal configuration files

## ${toc_name}

${config_list.map(
    config => `- [${config.name}](#${config.name})${config.emoji} `
  ).join('\n')}

${config_list.map(
    config =>{
      return format(`
### ${config.name}
	 
[${top_name}](${top_href})

\`\`\`${config.hl}		    
${create_content(config.name)}
\`\`\`
`)
    }
  ).join('\n'.repeat(2))}

`

  return format(res)
}

const markdown_content = create_readme()
fs.writeFile(output_filename, markdown_content, 'utf8',err=>{
  if(err) {throw err}
})


