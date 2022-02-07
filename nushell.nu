let names = [ Laxmi Anup Aruj Birat]
echo $names | each -n { build-string "Hello, "  $it.index "!" }


let colors = [red green blue]
= $colors | empty? 


let colors2 = [red orange yellow green blue purple]
'blue' in $colors 

'yellow' in $colors

echo " "
let scores = [7 8 9 10 11]
echo $scores | where $it > 7

echo $colors | any? (echo $it | str ends-with "e") | each {build-string $it " is " }

^echo "testing out how dataframe flatting method "

echo [1 [2 3] 4 [5 6]] | flatten
echo [2 [4 5] 6 [6 7]]  

let scores = [4 5 6 7 8]
echo (echo $scores | reduce { $acc + $it })

^echo "this is test"

let zones = [UTC Asia/Kathmandu]
echo $zones
echo $zones | wrap 'Zone' | insert Time {(date now | date to-timezone $it.Zone | date format '%Y.%m.%d %H:%M')}



ls | select name size 
ls | sort-by size | first 5
ls | get name


open test.toml | insert next_edition 2022 

echo "test "
open test.toml | update edition 2033

#example of multiline pipeline
{ 
	"01/22/2021" |
		parse "{month}/{day}/{year}"|
		get year
}


echo $nu.env.TOO

def share-code [file: string] {
let file_exists = ($file | path exists);

if $file_exists { 
let file_contents = (sed -e 's/\r//' -e 's/\t/\\t/g' -e 's/"/\\"/g' $file| awk ' { printf($0 "\\n") }')
let build_json = (build-string '{"public": true,"description": "' $file '","files": {"[filename]": {"filename": "' $file '", "content": "' $file_contents '"}}}')
let response = (curl -H "Authorization: token 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" https://api.github.com/gists -H "Accept: application/vnd.github.v3+json" -X  POST -d $build_json)
let create_playground_url = ($response | from json | get url | awk '{sub(/^.+gists\//,""); print}' | build-string 'https://play.rust-lang.org/?version=stable&mode=debug&edition=2018&gist=' $in) 
echo $create_playground_url
} {echo "file doesn't exist" }
}

