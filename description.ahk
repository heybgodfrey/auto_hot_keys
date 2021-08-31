; Product Description Tool
; Last Updated 10/6/16
; Written by Bryan Godfrey S/S Reno
; Project Leaders: Chad Jenkins, Shea Richardson, Dru McPherson


; Current Version 1.08
;
; This tool will process a copied URL of a sizing lineup link or product description page and provide product description information based on that URL.
;
; 1. Products
; 
; At this time, we have around 1000 products available in this tool. If the product is not currently added to this tool, the user will see a window stating that the product is not available. At this time,
; there are no plans to add more products to this tool.
;
; 2. Complements
;
; Whenever a product with a ladies/unisex/adult/youth complement is processed, the description will reference that product name (if unisex or ladies) and/or let the customer know in the text that there are
; youth and adult sizes available for certain colors.
;
; 3. Product IDs
;
; As long as the product ID for each product remains static, the tool will be able to process that product URL. If the product ID changes, we will need to update this script in order to make sure that the 
; tool works correctly.


#Include  %A_ScriptDir%

^l::
prevClip := Clipboard
incNumber := Clipboard
try
{
Reporting("proddesc")
}

titleLink = title-link
imageLink = image-link

IfInString, incNumber, styles
{
If InStr(incNumber, "title-link") or InStr(incNumber, "image-link")
{
StringTrimRight, trimmedString, incNumber, 11
}
else
{
trimmedString = %incNumber%
}
}
else
{
trimmedString = %incNumber%
}


; List all product fabric/material details

fab80 = 100`% Acrylic Knit
fab79 = 100`% Bio-Washed Chino Twill
fab91 = 100`% Brushed Cotton Twill
fab31 = 100`% Cool Mesh Polyester
fab151 = 100`% Cotton
fab16 = 100`% Cotton
fab33 = 100`% Cotton
fab101 = 100`% Cotton Canvas
fab76 = 100`% Cotton Flannel
fab51 = 100`% Cotton Fleece
fab87 = 100`% Cotton Front & Nylon/Spandex Mesh in Mid/Back
fab81 = 100`% Cotton Front & Polyester/Spandex Mesh in Mid/Back
fab103 = 100`% Cotton Garment-Washed Canvas
fab59 = 100`% Cotton Silkwash Pique
fab145 = 100`% Cotton Terry
fab144 = 100`% Cotton Terry Velour
fab89 = 100`% Cotton Twill
fab86 = 100`% Flat Back Mesh Polyester
fab42 = 100`% Performance Fleece
fab39 = 100`% Micro-Mesh
fab45 = 100`% Microfiber Polyester
fab150 = 100`% Moisture-Wicking Polyester
fab127 = 100`% Neoprene With a Polyester Shell
fab70 = 100`% Nylon
fab23 = 100`% Nylon Shell
fab44 = 100`% Polyester
fab60 = 100`% Polyester
fab83 = 100`% Polyester
fab4 = 100`% Polyester
fab20 = 100`% Polyester
fab22 = 100`% Polyester Brushed Tricot
fab41 = 100`% Polyester Double Mesh
fab26 = 100`% Polyester Fleece
fab66 = 100`% Polyester Fleece
fab67 = 100`% Polyester Fleece Shell/Nylon Trim
fab25 = 100`% Polyester French Terry
fab95 = 100`% Polyester Front, 100`% Nylon Mesh Back
fab106 = 100`% Polyester Front, 100`% Polyester Mesh Back
fab40 = 100`% Polyester Jersey Interlock
fab84 = 100`% Polyester Knit Mesh
fab46 = 100`% Polyester Mesh
fab61 = 100`% Polyester Micro-Mesh
fab71 = 100`% Polyester Microfiber
fab65 = 100`% Polyester Microfleece
fab29 = 100`% Polyester Patterned Jacquard
fab36 = 100`% Polyester Pique Knit
fab62 = 100`% Polyester Pique Mesh
fab21 = 100`% Polyester Shell
fab69 = 100`% Polyester Shell
fab73 = 100`% Polyester Shell With Polyfill
fab34 = 100`% Polyester Tricot Mesh
fab37 = 100`% Polyester, Birdseye Pique Knit, Flatback Pique Mesh
fab1 = 100`% Pre-Shrunk Cotton
fab78 = 100`% Pre-Shrunk Cotton Fleece
fab63 = 100`% Pre-Shrunk Cotton Pique
fab58 = 100`% Pre-Shrunk Double Pique Cotton
fab52 = 100`% Pre-Shrunk Jersey-Knit Cotton
fab38 = 100`% Sublimated Polyester
fab64 = 100`% Textured Polyester
fab107 = 210 Denier Nylon
fab108 = 210 Denier Polyester
fab137 = 3M Neon Paper
fab136 = 3M Paper
fab102 = 420D Polyester
fab2 = 50/50 Poly/Cotton Blend fabric
fab9 = 60/40 Poly/Cotton Blend fabric
fab105 = 600 Denier Polyester
fab109 = 600 Denier Recycled Material
fab47 = 65`% Polyester / 35`% Cotton Twill
fab94 = 97`% Polyester, 3`% Spandex
fab125 = Acrylic
fab85 = Acrylic/Wool Blend
fab48 = Brushed Cotton / Polyester Poplin Blend
fab139 = Clear Static Material
fab104 = Cotton Canvas / Polypropylene Handles
fab90 = Cotton Twill, Spandex Blend
fab98 = Cotton/Poly Baby Twill Blend
fab99 = Cotton/Poly Blend
fab96 = Cotton/Poly Broadcloth Blend
fab146 = Cotton/Poly/Spandex Blend
fab100 = Cotton/Poly/Spandex Blend
fab88 = Cotton/Polyester Blend
fab82 = Cotton/Polyester Twill Blend
fab77 = Cotton/Spandex Blend
fab5 = Dazzle Fabric
fab118 = Double Wall Mid-Weight Plastic
fab56 = Double-Pique Poly/Cotton Blend
fab122 = Durable Plastic
fab130 = Flexible Magnet Material
fab141 = Glass
fab112 = Glossy Ceramic
fab123 = Heavy Duty Plastic
fab126 = Heavy Duty Polycarbonate
fab115 = Heavy-Duty Insulated Acrylic
fab121 = High Quality Glass
fab114 = Insulated Foam
fab119 = Insulated Foam With Alumninum Carabiner
fab124 = Lightweight Aluminum
fab133 = Metal
fab134 = Metal With 23k Gold Plated Accents
fab135 = Metal With Polished Chrome Plated Trim
fab113 = Mid-Weight Plastic
fab120 = Neoprene
fab142 = Nylon
fab43 = Permanent Press Poplin - Poly/Cotton Blend
fab97 = Permanent Press Poplin - Poly/Cotton Blend
fab55 = Peruvian Pima Interlock Cotton
fab57 = Pique Poly/Cotton Blend
fab117 = Plastic
fab129 = Plastic
fab131 = Plastic With Rubber Grip Surface
fab132 = Plastic With Soft Contoured Foam Grip
fab149 = Poly/Cotton Blend Fabric
fab110 = Poly/Cotton Blend Fabric
fab49 = Poly/Cotton Blend Fabric
fab53 = Poly/Cotton Blend Fabric
fab75 = Poly/Cotton Blend Fabric
fab28 = Poly/Cotton Blend Fabric
fab27 = Poly/Spandex Blend
fab24 = Poly/Spandex Soft Shell
fab72 = Poly/Spandex Soft Shell
fab140 = Polyester
fab30 = Polyester Flat Back Mesh
fab35 = Polyester Jersey / Polyester Twill
fab32 = Polyester Mesh
fab92 = Polyester, Cotton, Spandex Blend with a Wool-Like Twill Texture
fab93 = Polyester/Mesh/Nylon Blend
fab148 = Polyester/Viscose Blend
fab143 = Polypropylene
fab54 = Pre-Shrunk Poly/Cotton Blend
fab50 = Pre-shrunk Poly/Cotton Blend
fab68 = Premium Microfiber Polyester
fab111 = Scuba Foam/Cloth Laminated
fab128 = Soft Neoprene, Fabric Covered Surface
fab147 = Tri-Blend fabric
fab3 = Tri-Blend fabric
fab138 = Vinyl
fab116 = Vinyl With Insulated Foam

; List all fabric extras variables

ext23 = Soft 1x1 Baby Ribbed Fabric
ext2 = Soft 1x1 Baby Ribbed Fabric
ext16 = Soft 1x1 Baby Ribbed Fabric
ext69 = 3 front pockets for added storage
ext52 = Additional lace colors available
ext26 = Made with anti-microbial technology
ext109 = Made with anti-microbial technology
ext95 = Convenient audio port access included
ext44 = Convenient audio port access included
ext115 = Convenient back pocket
ext147 = Convenient back pocket
ext118 = BPA Free
ext113 = Brand logo included on apparel
ext104 = Brand logo included on apparel
ext81 = Brand logo included on apparel
ext76 = Brand logo included on apparel
ext70 = Brand logo included on apparel
ext59 = Brand logo included on apparel
ext34 = Brand logo included on apparel
ext50 = Brand logo included on apparel
ext88 = Brand sticker included on apparel
ext80 = Adjustable buckle closure
ext119 = Collapsible
ext12 = Soft combed cotton
ext148 = Bold contrast colors
ext27 = Bold contrast colors
ext110 = Bold contrast colors
ext101 = Bold contrast colors
ext79 = Dual chest pockets
ext68 = Dual front pockets
ext73 = Dyed to match buttons
ext56 = Dyed to match buttons
ext28 = Dyed to match buttons
ext107 = Convenient exterior pocket
ext75 = Fade resistant fabric
ext108 = Fence hook
ext97 = Front pockets
ext41 = Front pockets
ext10 = Front pouch pocket
ext35 = Front pouch pocket
ext48 = Front pouch pockets
ext120 = Handwash only required
ext100 = Convenient hidden Pocket
ext89 = High-profile crown
ext105 = Insulated for added warmth
ext121 = Insulated for added warmth
ext106 = Convenient interior pocket
ext45 = Convenient interior pocket
ext58 = Left pocket
ext6 = Left pocket
ext66 = Left pocket
ext72 = Left pocket
ext114 = Leg zippers
ext57 = Fashionable longer length
ext14 = Fashionable longer length
ext24 = Fashionable longer length
ext9 = Made in USA
ext53 = Made in USA
ext116 = Made in USA
ext17 = Made in USA
ext123 = Matching color straw
ext37 = Convenient media player pocket
ext47 = Convenient media pocket
ext111 = Moisture management technology
ext3 = Moisture management technology
ext87 = Moisture management technology
ext21 = Moisture management technology
ext22 = Moisture management technology
ext25 = Moisture management technology
ext103 = No-pill technology
ext82 = Not sold blank
ext33 = Odor resistant
ext4 = Organic Fabric
ext94 = Packable
ext40 = Pen pocket
ext146 = Pigment-dyed
ext145 = Pigment-dyed
ext60 = Pill resistant
ext49 = Pill resistant
ext36 = Pill resistant
ext99 = Pill resistant
ext15 = Convenient pocket
ext85 = Pre-curved bill/visor
ext124 = Push/Pull cap
ext30 = Raglan apparel
ext18 = Raglan apparel
ext11 = Raglan apparel
ext51 = Raglan apparel
ext98 = Raglan apparel
ext141 = Reflective Piping
ext29 = Reversible
ext19 = Soft ringspun fabric
ext1 = Soft ringspun fabric
ext13 = Soft ringspun fabric
ext91 = Roll-away hood
ext96 = Side pockets
ext112 = Side pockets
ext38 = Side pockets
ext144 = Side seams
ext32 = Snag resistant
ext64 = Snag resistant
ext122 = Spill resistant
ext65 = Stain resistant
ext77 = Stain resistant
ext139 = Stain resistant
ext63 = Stain resistant
ext5 = Superfine ribbed fabric
ext127 = Tagless for added comfort
ext129 = Tagless for added comfort
ext130 = Tagless for added comfort
ext131 = Tagless for added comfort
ext126 = Tagless for added comfort
ext128 = Tagless for added comfort
ext125 = Tagless for added comfort
ext8 = Longer body and sleeves
ext133 = Tear-away tag
ext138 = Tear-away tag
ext137 = Tear-away tag
ext136 = Tear-away tag
ext135 = Tear-away tag
ext132 = Tear-away tag
ext134 = Tear-away tag
ext67 = Thermometer pocket
ext39 = Thumbholes to keep hands warm
ext102 = Thumbholes to keep hands warm
ext117 = Top rack dishwasher safe
ext86 = Two-tone fabric
ext142 = Underarm vents
ext83 = Unstructured cap
ext31 = UPF sun protection
ext61 = UPF sun protection
ext84 = UV protection
ext55 = Wash with like colors
ext54 = Wash with like colors
ext74 = Wash with like colors
ext43 = Water resistant
ext92 = Water resistant
ext90 = Waterproof
ext42 = Waterproof
ext46 = Wind resistant
ext93 = Wind resistant
ext62 = Wrinkle resistant
ext78 = Wrinkle resistant
ext71 = Wrinkle-free
ext149 = Three-button henley placket
ext150 = Ruching at racerback seam
ext151 = Curved bottom hem
ext152 = Low cut armholes
ext153 = Lightweight Microburn panel and matching double sleeve stripe
ext154 = Slouchy drop shoulder
ext155 = Wide scoop neck
ext156 = Fashion-forward cropped top
ext157 = Moisture management and anti-microbial technology
ext158 = Stand up cadet collar
ext159 = Rib-knit cuffs and waistband for added comfort
ext160 = Cross-dyed fabric (two colors in one fabric)
ext161 = Brass finished zipper
ext162 = Anti-static
ext163 = 1/8" thick. Fits most standard cans
ext164 = Camo pattern will vary on each can cooler
ext165 = Thick glass construction
ext166 = Two-tone finger grip lid and caribiner
ext167 = Hand wash recommended
ext168 = Double walled insulation
ext169 = Matching color screw-top lid, straw, and bottom
ext170 = Hand wash only
ext171 = Spill resistant spout
ext172 = Leak resistant cap
ext173 = Liquid measurement scales displayed on back
ext174 = Lids available for an additional cost
ext175 = Changes colors with ice cold liquids
ext176 = White or black ink recommended for best results
ext177 = Easy slide close lid
ext178 = No slip rubber bottom grip
ext179 = Screw top lid
ext180 = Button-down collar
ext181 = Durable, impact-resistant buttons
ext182 = 2 inch wide reflective taping on front and back
ext183 = Velcro front closure
ext184 = Right chest 2-division pocket
ext185 = Left chest 4-division pocket
ext186 = Two lower outside flap patch pockets
ext187 = Two inside patch pockets
ext188 = Zipper front closure
ext189 = Watertight insulation
ext190 = Interior zippered pocket
ext191 = Bottom gusset
ext192 = Large main section with smaller interior pockets
ext193 = Left side pocket
ext194 = Front pocket
ext195 = Customizable tag on front
ext196 = Front zippered pocket
ext197 = Side mesh pockets on ends
ext198 = Web binding on bottom to clip a water bottle
ext199 = End zippered pocket with shoe liner
ext200 = Bottom zipper holds backpack strap option
ext201 = Side mesh pocket
ext202 = Six-panel construction
ext203 = Mid-profile look
ext204 = Climacool technology
ext205 = Structured cap
ext206 = Stretch fit headband
ext207 = Low profile look
ext208 = Adjustable velcro back
ext209 = Plastic adjustable snapback closure 
ext210 = Five-panel construction
ext211 = Adjustable fabric back
ext212 = High profile crown

; List Country for delivery vars

country0 = USA
country1 = Canada

; List decoration method vars

deco1 = Screenprinted
deco2 = Embroidery
deco3 = Screen/Digital print

; List Fit for product vars

fit1 = true to size fit
fit2 = junior size fit
fit3 = trendy fitted sizing
fit4 = generous size fit
fit5 = one size fits all

; List gender vars

gen0 = N/A
gen1 = unisex
gen2 = ladies

; List lightweight/midweight/heavyweight vars

weight0 = midweight
weight1 = lightweight
weight2 = heavyweight

; List cat vars

cat1 = T-shirts
cat2 = Ladies & Juniors
cat3 = Athletics
cat4 = Hoodies & Sweatshirts
cat5 = Polos
cat6 = Drinkware & Koozies
cat7 = Hats
cat8 = Youth
cat9 = Button Down Shirts
cat10 = Uniforms
cat11 = Bags
cat12 = Outerwear
cat13 = Pens & Supplies
cat14 = Pants
cat15 = Fun Stuff

; List singular category statements.

singularcat1 = this t-shirt
singularcat2 = this women's apparel
singularcat3 = performance shirt
singularcat4 = this sweatshirt apparel
singularcat5 = this polo
singularcat6 = this drinkware
singularcat7 = this hat
singularcat8 = this youth apparel
singularcat9 = this button down shirt
singularcat10 = this uniform
singularcat11 = this bag
singularcat12 = this outerwear apparel
singularcat13 = these custom supplies
singularcat14 = these pants
singularcat15 = these fun items

; List subcat vars

subcat1 = Short Sleeve
subcat2 = Long Sleeve
subcat3 = Tank Tops & Sleeveless
subcat5 = Juniors Short Sleeve & Tank Tops
subcat6 = Ladies Short Sleeve & Tank Tops
subcat7 = Long Sleeve
subcat9 = Teamwear & Jerseys
subcat11 = Performance Shirts
subcat15 = Performance Polo
subcat17 = Warm-Ups & Jackets
subcat19 = Hoodies
subcat20 = Performance Sweatshirts
subcat21 = Zip Sweatshirts
subcat22 = Crewneck Sweatshirts
subcat23 = Zip Hoodies
subcat24 = Embroidered Polos
subcat25 = Screen Printed Polos
subcat26 = Koozies
subcat27 = Glassware
subcat28 = Water Bottles
subcat29 = Cups
subcat30 = Mugs
subcat31 = Baseball Hats
subcat32 = Winter Hats
subcat33 = Visors
subcat34 = Dress Shirts
subcat35 = Casual Shirts
subcat39 = Safety/Hi-Visibility
subcat40 = Scrubs/Medical
subcat41 = Aprons/Restaurant
subcat42 = Tote Bags
subcat43 = Cinchpacks & Backpacks
subcat44 = Athletic & Duffels
subcat45 = Coolers
subcat46 = Portfolio Bags
subcat47 = Windshirts
subcat48 = Soft Shells
subcat49 = Polar Fleece
subcat50 = Vests
subcat51 = Windbreakers
subcat52 = Rain Jackets
subcat53 = Athletic Jackets
subcat54 = Pens
subcat55 = Magnets
subcat56 = Stickers
subcat57 = Paper Products
subcat58 = Mouse Pads
subcat59 = Tablet Sleeves
subcat60 = Shorts
subcat61 = Sweatpants
subcat62 = Warm-Up Pants
subcat64 = Loungewear
subcat66 = Youth T-shirts
subcat67 = Youth Girls
subcat71 = Premium Hats
subcat72 = Toddlers
subcat73 = Infants
subcat74 = Umbrellas
subcat75 = Ornaments
subcat76 = Frisbees
subcat77 = Rally Towels
subcat78 = Youth Hats
subcat79 = Youth Polos
subcat80 = Youth Hoodies
subcat81 = Youth Crewneck Sweatshirts
subcat82 = Youth Shorts
subcat83 = Youth Performance Sweatshirts
subcat84 = Youth Warm-Up Pants
subcat85 = Youth Teamwear & Jerseys
subcat86 = Youth Performance Shirts
subcat87 = Youth Performance Polos
subcat88 = Youth Warm-Up Jacket
subcat89 = Youth Polar Fleece
subcat90 = Youth Windbreakers
subcat91 = Youth Windshirts
subcat92 = Youth Pants

records1100 = - %ext1%`r`n- %ext125%`r`n
records4900 = - %ext3%`r`n- %ext125%`r`n
records5100 = - %ext1%`r`n- %ext125%`r`n
records10200 = - %ext48%`r`n
records15000 = - %ext1%`r`n- %ext9%`r`n
records19700 = - %ext4%`r`n
records30000 = - %ext14%`r`n- %ext17%`r`n- %ext13%`r`n
records50000 = - %ext85%`r`n- %ext202%`r`n- %ext207%`r`n
records52000 = - %ext85%`r`n- %ext202%`r`n- %ext207%`r`n- %ext206%`r`n
records73000 = - %ext118%`r`n- %ext9%`r`n
records74000 = - %ext118%`r`n- %ext9%`r`n
records79000 = - %ext117%`r`n
records85263 = - %ext44%`r`n
records96100 = - %ext48%`r`n
records97600 = - %ext9%`r`n
records98200 = - %ext1%`r`n- %ext9%`r`n
records98900 = - %ext48%`r`n
records99000 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n- %ext127%`r`n
records99600 = - %ext48%`r`n
records99700 = - %ext6%`r`n
records100200 = - %ext202%`r`n- %ext203%`r`n- %ext206%`r`n
records100300 = - %ext86%`r`n- %ext89%`r`n- %ext210%`r`n- %ext209%`r`n
records100400 = - %ext80%`r`n- %ext83%`r`n- %ext85%`r`n- %ext207%`r`n
records100500 = - %ext126%`r`n
records101200 = - %ext173%`r`n- %ext118%`r`n- %ext170%`r`n
records103600 = - %ext163%`r`n- %ext9%`r`n- %ext164%`r`n
records107200 = - %ext49%`r`n
records108200 = - %ext48%`r`n- %ext49%`r`n
records108600 = - %ext117%`r`n
records108900 = - %ext117%`r`n
records109600 = - %ext117%`r`n- %ext164%`r`n
records109700 = - %ext97%`r`n
records111900 = - %ext112%`r`n- %ext113%`r`n
records112000 = - %ext50%`r`n
records112200 = - %ext92%`r`n- %ext93%`r`n
records112800 = - %ext25%`r`n
records113100 = - %ext34%`r`n
records113300 = - %ext125%`r`n
records116200 = - %ext125%`r`n
records116900 = - %ext9%`r`n
records117100 = - %ext48%`r`n- %ext53%`r`n
records118900 = - %ext194%`r`n- %ext195%`r`n
records119700 = - %ext48%`r`n
records119900 = - %ext48%`r`n- %ext128%`r`n
records120000 = - %ext48%`r`n
records121200 = - %ext48%`r`n- %ext51%`r`n
records121400 = - %ext172%`r`n- %ext118%`r`n- %ext167%`r`n
records121600 = - %ext117%`r`n
records121700 = - %ext117%`r`n
records122500 = - %ext13%, %ext16%`r`n
records122600 = - %ext13%, %ext16%`r`n
records122700 = - %ext13%, %ext16%, %ext18%`r`n
records122800 = - %ext13%, %ext16%, %ext18%`r`n
records122900 = - %ext13%, %ext16%`r`n
records123000 = - %ext48%`r`n- %ext53%`r`n
records123200 = - %ext13%, %ext16%`r`n
records124200 = - %ext1%`r`n
records124300 = - %ext1%`r`n
records124500 = - %ext1%`r`n- %ext11%`r`n
records125000 = - %ext1%`r`n- %ext132%`r`n
records127300 = - %ext4%`r`n
records129800 = - %ext48%`r`n
records130900 = - %ext158%`r`n
records131100 = - %ext125%`r`n
records134100 = - %ext130%`r`n
records134300 = - %ext19%`r`n
records134500 = - %ext130%`r`n
records135300 = - %ext48%`r`n- %ext49%`r`n
records135400 = - %ext48%`r`n
records135700 = - %ext48%`r`n
records136300 = - %ext48%`r`n
records136900 = - %ext126%`r`n
records137000 = - %ext126%`r`n
records137800 = - %ext25%`r`n- %ext142%`r`n
records137900 = - %ext25%`r`n- %ext142%`r`n
records138400 = - %ext34%`r`n
records138400 = - %ext127%`r`n
records138600 = - %ext27%`r`n
records138700 = - %ext1%`r`n- %ext6%`r`n- %ext125%`r`n
records139200 = - %ext171%`r`n- %ext118%`r`n- %ext9%`r`n- %ext167%`r`n
records139900 = - %ext130%`r`n
records140700 = - %ext23%`r`n
records141000 = - %ext23%`r`n
records141500 = - %ext6%`r`n
records141600 = - %ext13%`r`n
records141800 = - %ext112%`r`n
records150600 = - %ext13%`r`n- %ext14%`r`n- %ext17%`r`n
records151000 = - %ext1%,`r`n- %ext9%`r`n
records151600 = - %ext3%`r`n- %ext125%`r`n
records152100 = - %ext19%`r`n
records152600 = - %ext49%`r`n
records153100 = - %ext9%`r`n
records153200 = - %ext1%`r`n- %ext9%`r`n
records153400 = - %ext48%`r`n
records155400 = - %ext130%`r`n
records157500 = - %ext9%`r`n
records158000 = - %ext132%`r`n
records158100 = - %ext132%`r`n
records158300 = - %ext27%`r`n- %ext30%`r`n
records158500 = - %ext137%`r`n
records159400 = - %ext85%`r`n- %ext86%`r`n- %ext203%`r`n- %ext202%`r`n- %ext208%`r`n
records159500 = - %ext80%`r`n- %ext85%`r`n
records159700 = - %ext63%`r`n
records159900 = - %ext56%`r`n
records160000 = - %ext56%`r`n
records160600 = - %ext118%`r`n- %ext166%`r`n- %ext167%`r`n
records160700 = - %ext157%`r`n- %ext27%`r`n- %ext34%`r`n- %ext127%`r`n
records160800 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records160900 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records161000 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records161100 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records161300 = - %ext118%`r`n- %ext9%`r`n
records161600 = - %ext17%`r`n
records161700 = - %ext1%`r`n
records162000 = - %ext157%`r`n- %ext27%`r`n- %ext28%`r`n- %ext34%`r`n- %ext127%`r`n
records162300 = - %ext13%`r`n- %ext16%`r`n
records163400 = - %ext19%`r`n-
records163600 = - %ext56%`r`n
records163700 = - %ext80%`r`n- %ext85%`r`n
records163800 = - %ext48%`r`n- %ext128%`r`n
records163900 = - %ext157%`r`n- %ext34%`r`n
records164100 = - %ext9%`r`n- %ext118%`r`n- %ext167%`r`n
records165500 = - %ext175%`r`n- %ext118%`r`n- %ext9%`r`n- %ext176%`r`n- %ext117%`r`n
records164200 = - %ext118%`r`n- %ext9%`r`n- %ext167%`r`n
records164300 = - %ext192%`r`n- %ext193%`r`n
records164500 = - %ext201%`r`n
records165200 = - %ext99%`r`n
records165600 = - %ext34%`r`n
records165600 = - %ext25%`r`n- %ext127%`r`n
records165700 = - %ext157%`r`n- %ext27%`r`n- %ext34%`r`n- %ext127%`r`n
records165800 = - %ext157%`r`n- %ext27%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n
records165900 = - %ext25%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n
records166000 = - %ext25%`r`n- %ext30%`r`n- %ext127%`r`n
records166200 = - %ext1%`r`n- %ext4%`r`n- %ext132%`r`n
records166300 = - %ext13%`r`n- %ext133%`r`n
records166400 = - %ext25%`r`n- %ext27%`r`n
records166700 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records167200 = - %ext13%`r`n- %ext16%`r`n
records167800 = - %ext25%`r`n- %ext127%`r`n
records168000 = - %ext6%`r`n
records168500 = - %ext48%`r`n- %ext49%`r`n
records168600 = - %ext48%`r`n- %ext49%`r`n
records168700 = - %ext25%`r`n- %ext27%`r`n
records168900 = - %ext27%`r`n- %ext41%`r`n
records169000 = - %ext48%`r`n
records169200 = - %ext96%`r`n
records169300 = - %ext96%`r`n- %ext98%`r`n
records169400 = - %ext27%`r`n- %ext35%`r`n
records169500 = - %ext96%`r`n- %ext98%`r`n
records169600 = - %ext25%`r`n- %ext27%, %ext30%, %ext127%`r`n
records169700 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n
records169800 = - %ext132%`r`n
records169900 = - %ext9%`r`n
records170200 = - %ext13%`r`n- %ext14%`r`n
records170600 = - %ext34%`r`n
records170700 = - %ext25%`r`n- %ext127%`r`n
records171000 = - %ext96%`r`n
records171100 = - %ext93%`r`n- %ext96%`r`n- %ext98%`r`n
records171200 = - %ext96%`r`n- %ext98%`r`n
records171300 = - %ext130%`r`n
records171500 = - %ext189%`r`n
records171700 = - %ext168%`r`n- %ext123%`r`n- %ext118%`r`n
records172100 = - %ext1%`r`n
records172100 = - %ext132%`r`n
records172300 = - %ext132%`r`n
records172500 = - %ext13%`r`n- %ext133%`r`n
records172700 = - %ext133%`r`n
records172800 = - %ext13%`r`n- %ext14%`r`n- %ext133%`r`n
records172900 = - %ext13%`r`n- %ext14%`r`n
records173100 = - %ext13%`r`n- %ext14%`r`n
records173800 = - %ext25%`r`n- %ext27%`r`n
records174000 = - %ext30%`r`n
records174100 = - %ext27%`r`n- %ext30%`r`n- %ext35%`r`n- %ext44%`r`n
records174200 = - %ext48%`r`n- %ext52%`r`n
records174900 = - %ext25%`r`n- %ext27%`r`n
records175000 = - %ext29%`r`n- %ext141%`r`n
records175200 = - %ext9%`r`n
records175300 = - %ext9%`r`n
records175600 = - %ext13%`r`n- %ext14%`r`n- %ext133%`r`n
records175700 = - %ext13%`r`n
records175800 = - %ext1%`r`n- %ext145%`r`n
records175900 = - %ext1%`r`n- %ext55%`r`n- %ext145%`r`n
records176000 = - %ext1%`r`n- %ext125%`r`n
records176100 = - %ext1%`r`n
records176300 = - %ext129%`r`n
records176400 = - %ext157%`r`n- %ext27%`r`n- %ext34%`r`n- %ext127%`r`n
records176800 = - %ext1%`r`n
records176900 = - %ext13%`r`n- %ext126%`r`n
records177000 = - %ext14%`r`n
records177200 = - %ext25%`r`n- %ext28%`r`n- %ext31%`r`n- %ext127%`r`n
records177400 = - %ext72%`r`n- %ext73%`r`n- %ext78%`r`n
records177500 = - %ext72%`r`n- %ext28%`r`n- %ext181%`r`n
records177600 = - %ext73%`r`n- %ext78%`r`n
records177700 = - %ext82%`r`n- %ext88%`r`n- %ext89%`r`n- %ext202%`r`n- %ext209%`r`n
records177800 = - %ext82%`r`n- %ext88%`r`n- %ext203%`r`n- %ext202%`r`n- %ext206%`r`n
records177900 = - %ext82%`r`n- %ext86%`r`n- %ext88%`r`n- %ext202%`r`n- %ext203%`r`n
records178000 = - %ext85%`r`n- %ext207%`r`n- %ext208%`r`n
records178100 = - %ext80%`r`n- %ext85%`r`n- %ext202%`r`n- %ext211%`r`n- %ext83%`r`n
records178300 = - %ext85%`r`n- %ext207%`r`n- %ext202%`r`n- %ext208%`r`n
records178400 = - %ext19%`r`n- %ext23%`r`n
records178600 = - %ext19%`r`n- %ext23%`r`n
records179000 = - %ext19%`r`n- %ext137%`r`n
records179100 = - %ext19%`r`n- %ext24%`r`n
records179800 = - %ext132%`r`n
records179900 = - %ext133%`r`n
records180100 = - %ext14%`r`n
records180200 = - %ext48%`r`n- %ext53%`r`n
records180300 = - %ext53%`r`n
records180400 = - %ext48%`r`n
records180500 = - %ext48%`r`n
records180600 = - %ext48%`r`n
records180700 = - %ext112%`r`n
records180800 = - %ext30%`r`n- %ext127%`r`n
records180900 = - %ext30%`r`n- %ext35%`r`n- %ext39%`r`n- %ext127%`r`n
records181100 = - %ext191%`r`n
records181200 = - %ext48%`r`n- %ext54%`r`n- %ext146%`r`n
records181300 = - %ext54%`r`n- %ext146%`r`n
records181500 = - %ext48%`r`n
records181600 = - %ext112%`r`n
records181700 = - %ext48%`r`n
records182400 = - %ext49%`r`n
records182500 = - %ext58%`r`n
records182600 = - %ext56%`r`n
records182700 = - %ext117%`r`n- %ext9%`r`n- %ext118%`r`n
records182800 = - %ext117%`r`n- %ext9%`r`n- %ext118%`r`n
records182900 = - %ext23%`r`n
records183100 = - %ext86%`r`n
records183200 = - %ext86%`r`n
records183300 = - %ext81%`r`n- %ext86%`r`n
records183400 = - %ext86%`r`n
records183500 = - %ext19%`r`n- %ext137%`r`n
records183600 = - %ext19%`r`n
records183700 = - %ext69%`r`n
records183800 = - %ext68%`r`n
records183900 = - %ext68%`r`n
records184000 = - %ext19%`r`n
records184100 = - %ext130%`r`n
records184200 = - %ext19%`r`n- %ext137%`r`n
records184300 = - %ext19%`r`n
records184400 = - %ext19%`r`n
records184700 = - %ext25%`r`n- %ext27%`r`n
records185300 = - %ext29%`r`n
records185500 = - %ext130%`r`n
records185900 = - %ext202%`r`n- %ext203%`r`n- %ext206%`r`n
records186400 = - %ext6%`r`n- %ext9%`r`n
records186500 = - %ext9%`r`n
records186600 = - %ext9%`r`n
records186700 = - %ext9%`r`n
records186800 = - %ext132%`r`n
records187200 = - %ext17%`r`n
records187400 = - %ext13%`r`n- %ext14%`r`n- %ext133%`r`n
records187500 = - %ext13%`r`n- %ext133%`r`n
records187600 = - %ext150%`r`n
records187800 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records187900 = - %ext29%`r`n
records188100 = - %ext29%`r`n- %ext141%`r`n
records188200 = - %ext58%`r`n- %ext129%`r`n
records188300 = - %ext6%`r`n
records188600 = - %ext13%`r`n
records188700 = - %ext13%`r`n
records188900 = - %ext25%`r`n- %ext134%`r`n
records189000 = - %ext25%`r`n- %ext30%`r`n- %ext36%`r`n- %ext127%`r`n
records189100 = - %ext63%`r`n
records189200 = - %ext63%`r`n
records189300 = - %ext182%`r`n- %ext72%`r`n
records189400 = - %ext182%`r`n- %ext72%`r`n- %ext50%`r`n
records190100 = - %ext183%`r`n- %ext182%`r`n- %ext72%`r`n
records190200 = - %ext182%`r`n- %ext184%`r`n- %ext185%`r`n- %ext186%`r`n- %ext187%`r`n- %ext188%`r`n
records190300 = - %ext13%`r`n- %ext133%`r`n
records190400 = - %ext63%`r`n
records190700 = - %ext13%`r`n
records190900 = - %ext133%`r`n
records191000 = - %ext157%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records191100 = - %ext25%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records191200 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records191300 = - %ext26%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records191700 = - %ext1%`r`n
records191800 = - %ext1%`r`n
records191900 = - %ext13%`r`n- %ext14%`r`n- %ext133%`r`n
records192000 = - %ext13%`r`n- %ext16%`r`n
records192300 = - %ext1%`r`n
records192400 = - %ext13%`r`n- %ext16%`r`n
records192500 = - %ext13%`r`n- %ext16%`r`n
records192700 = - %ext13%`r`n- %ext14%`r`n
records192800 = - %ext1%`r`n
records193100 = - %ext73%`r`n- %ext77%`r`n- %ext78%`r`n
records193200 = - %ext72%`r`n- %ext73%`r`n- %ext77%`r`n- %ext78%`r`n
records193800 = - %ext128%`r`n
records193900 = - %ext48%`r`n- %ext128%`r`n
records194000 = - %ext48%`r`n
records194100 = - %ext159%`r`n- %ext160%`r`n- %ext161%`r`n
records194300 = - %ext1%`r`n
records194400 = - %ext65%`r`n- %ext66%`r`n- %ext70%`r`n
records194500 = - %ext157%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records194800 = - %ext112%`r`n
records194900 = - %ext13%`r`n- %ext133%`r`n
records195000 = - %ext157%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records195100 = - %ext13%`r`n
records195200 = - %ext97%`r`n- %ext99%`r`n
records195300 = - %ext99%`r`n- %ext102%`r`n
records195400 = - %ext97%`r`n- %ext99%`r`n
records195500 = - %ext38%`r`n- %ext99%`r`n
records195600 = - %ext97%`r`n- %ext99%`r`n
records195700 = - %ext99%`r`n
records195800 = - %ext97%`r`n- %ext99%`r`n
records195900 = - %ext97%`r`n- %ext99%`r`n
records196000 = - %ext65%`r`n- %ext66%`r`n- %ext67%`r`n- %ext69%`r`n
records196300 = - %ext1%`r`n- %ext125%`r`n
records196600 = - %ext158%`r`n- %ext159%`r`n
records196700 = - %ext1%`r`n- %ext8%`r`n- %ext125%`r`n
records196800 = - %ext48%`r`n
records197000 = - %ext128%`r`n
records197100 = - %ext48%`r`n- %ext128%`r`n
records197400 = - %ext13%`r`n
records197500 = - %ext19%`r`n- %ext137%`r`n
records197600 = - %ext137%`r`n
records197700 = - %ext6%`r`n
records197900 = - %ext51%`r`n
records198200 = - %ext112%`r`n
records198600 = - %ext48%`r`n
records198700 = - %ext51%`r`n
records198800 = - %ext48%`r`n- %ext51%`r`n
records199000 = - %ext48%`r`n
records199100 = - %ext51%`r`n
records199200 = - %ext48%`r`n
records199300 = - %ext48%`r`n
records199400 = - %ext51%`r`n
records199500 = - %ext19%`r`n- %ext137%`r`n
records199800 = - %ext1%`r`n- %ext4%`r`n- %ext132%`r`n
records199900 = - %ext1%`r`n- %ext132%`r`n
records200000 = - %ext13%`r`n- %ext133%`r`n
records200100 = - %ext1%`r`n- %ext132%`r`n
records200800 = - %ext150%`r`n
records200900 = - %ext194%`r`n
records202000 = - %ext174%`r`n- %ext9%`r`n- %ext118%`r`n- %ext167%`r`n
records202100 = - %ext9%`r`n
records202400 = - %ext51%`r`n- %ext146%`r`n
records202500 = - %ext48%`r`n- %ext51%`r`n
records202600 = - %ext48%`r`n- %ext51%`r`n
records202800 = - %ext158%`r`n
records203000 = - %ext48%`r`n
records203200 = - %ext117%`r`n
records203300 = - %ext167%`r`n- %ext177%`r`n- %ext178%`r`n
records203400 = - %ext179%`r`n- %ext117%`r`n- %ext118%`r`n
records203500 = - %ext126%`r`n
records203600 = - %ext34%`r`n- %ext127%`r`n
records203700 = - %ext125%`r`n- %ext1%`r`n
records203800 = - %ext1%`r`n- %ext6%`r`n- %ext125%`r`n
records203900 = - %ext6%`r`n- %ext125%`r`n
records204100 = - %ext169%`r`n- %ext118%`r`n- %ext170%`r`n
records204200 = - %ext25%`r`n- %ext27%`r`n- %ext127%`r`n
records204300 = - %ext25%`r`n- %ext134%`r`n
records204400 = - %ext25%`r`n- %ext134%`r`n
records204500 = - %ext25%`r`n- %ext31%`r`n- %ext127%`r`n
records204600 = - %ext25%`r`n- %ext31%`r`n- %ext127%`r`n
records204700 = - %ext25%`r`n- %ext127%`r`n
records205000 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext134%`r`n
records205100 = - %ext25%`r`n- %ext30%`r`n- %ext134%`r`n
records205200 = - %ext157%`r`n- %ext27%`r`n- %ext30%`r`n- %ext134%`r`n
records205400 = - %ext25%`r`n- %ext28%`r`n- %ext32%`r`n- %ext127%`r`n
records205500 = - %ext25%`r`n- %ext32%`r`n- %ext127%`r`n
records205600 = - %ext157%`r`n- %ext134%`r`n
records205700 = - %ext25%`r`n- %ext27%`r`n- %ext28%`r`n- %ext30%`r`n- %ext127%`r`n
records205800 = - %ext26%`r`n- %ext31%`r`n- %ext32%`r`n- %ext139%`r`n- %ext127%`r`n- %ext162%`r`n
records205900 = - %ext157%`r`n- %ext31%`r`n- %ext32%`r`n- %ext127%`r`n- %ext139%`r`n- %ext162%`r`n
records206000 = - %ext27%`r`n- %ext30%`r`n- %ext38%`r`n
records206100 = - %ext38%`r`n- %ext147%`r`n
records206300 = - %ext27%`r`n- %ext38%`r`n
records206500 = - %ext38%`r`n- %ext147%`r`n
records206700 = - %ext25%`r`n- %ext134%`r`n
records206800 = - %ext25%`r`n- %ext31%`r`n- %ext127%`r`n
records206900 = - %ext22%`r`n- %ext137%`r`n
records207000 = - %ext25%`r`n- %ext28%`r`n- %ext32%`r`n- %ext127%`r`n
records207100 = - %ext25%`r`n- %ext127%`r`n
records207200 = - %ext157%`r`n- %ext134%`r`n
records207300 = - %ext30%`r`n- %ext38%`r`n
records207400 = - %ext38%`r`n
records207600 = - %ext137%`r`n
records207700 = - %ext137%`r`n
records207800 = - %ext25%`r`n- %ext38%`r`n
records207900 = - %ext1%`r`n- %ext6%`r`n- %ext145%`r`n- %ext55%`r`n
records208000 = - %ext1%`r`n- %ext145%`r`n
records208200 = - %ext13%`r`n
records208300 = - %ext25%`r`n- %ext27%`r`n- %ext134%`r`n
records208400 = - %ext19%`r`n- %ext130%`r`n
records208600 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext127%`r`n
records208800 = - %ext66%`r`n- %ext70%`r`n
records208900 = - %ext70%`r`n- %ext144%`r`n
records209000 = - %ext13%`r`n
records209100 = - %ext14%`r`n
records209400 = - %ext48%`r`n
records209500 = - %ext48%`r`n
records209600 = - %ext194%`r`n
records209800 = - %ext149%`r`n
records209900 = - %ext1%`r`n- %ext132%`r`n
records210100 = - %ext10%`r`n- %ext11%`r`n
records210200 = - %ext10%`r`n
records210300 = - %ext48%`r`n
records210600 = - %ext48%`r`n
records210700 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext127%`r`n
records210800 = - %ext22%`r`n- %ext130%`r`n
records210900 = - %ext48%`r`n
records211000 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext127%`r`n
records211200 = - %ext132%`r`n
records211300 = - %ext133%`r`n
records211400 = - %ext13%`r`n
records211500 = - %ext154%`r`n- %ext155%`r`n
records211600 = - %ext48%`r`n- %ext50%`r`n
records211700 = - %ext50%`r`n
records211800 = - %ext75%`r`n- %ext76%`r`n- %ext79%`r`n
records211900 = - %ext76%`r`n- %ext77%`r`n- %ext79%`r`n
records212000 = - %ext72%`r`n- %ext182%`r`n
records212100 = - %ext48%`r`n
records212200 = - %ext153%`r`n
records212300 = - %ext89%`r`n- %ext209%`r`n- %ext210%`r`n
records212400 = - %ext89%`r`n- %ext210%`r`n- %ext209%`r`n
records212600 = - %ext48%`r`n
records212700 = - %ext13%`r`n- %ext15%`r`n
records212800 = - %ext1%`r`n- %ext132%`r`n
records213200 = - %ext125%`r`n
records213300 = - %ext126%`r`n
records213400 = - %ext62%`r`n
records213500 = - %ext62%`r`n
records213600 = - %ext25%`r`n- %ext32%`r`n- %ext33%`r`n- %ext139%`r`n
records213700 = - %ext25%`r`n- %ext134%`r`n
records213800 = - %ext25%`r`n- %ext134%`r`n
records213900 = - %ext25%`r`n- %ext134%`r`n
records214000 = - %ext28%`r`n- %ext32%`r`n- %ext35%`r`n- %ext127%`r`n
records214100 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records214200 = - %ext145%`r`n
records214200 = - %ext1%`r`n
records214300 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n
records214500 = - %ext25%`r`n- %ext27%`r`n
records214600 = - %ext157%`r`n- %ext27%`r`n- %ext127%`r`n
records214700 = - %ext157%`r`n- %ext27%`r`n- %ext127%`r`n
records214900 = - %ext90%`r`n- %ext97%`r`n
records215000 = - %ext90%`r`n- %ext96%`r`n
records215100 = - %ext157%`r`n- %ext27%`r`n- %ext127%`r`n
records215200 = - %ext157%`r`n- %ext27%`r`n- %ext127%`r`n
records215300 = - %ext157%`r`n- %ext28%`r`n- %ext127%`r`n
records215400 = - %ext157%`r`n- %ext127%`r`n
records215600 = - %ext26%`r`n- %ext27%`r`n- %ext127%`r`n
records215700 = - %ext25%`r`n- %ext27%`r`n- %ext38%`r`n
records215800 = - %ext22%`r`n
records215900 = - %ext25%`r`n- %ext27%`r`n- %ext38%`r`n
records216000 = - %ext27%`r`n- %ext41%`r`n- %ext43%`r`n- %ext46%`r`n
records216100 = - %ext90%`r`n- %ext91%`r`n
records216200 = - %ext25%`r`n- %ext27%`r`n- %ext41%`r`n- %ext45%`r`n
records216300 = - %ext25%`r`n- %ext27%`r`n- %ext38%`r`n
records216400 = - %ext25%`r`n- %ext27%`r`n- %ext41%`r`n- %ext45%`r`n
records216500 = - %ext25%`r`n- %ext27%`r`n- %ext38%`r`n
records216600 = - %ext80%`r`n- %ext81%`r`n- %ext85%`r`n
records216700 = - %ext96%`r`n- %ext99%`r`n
records216800 = - %ext96%`r`n- %ext98%`r`n- %ext99%`r`n
records216900 = - %ext96%`r`n- %ext103%`r`n
records217100 = - %ext89%`r`n- %ext209%`r`n- %ext202%`r`n
records217200 = - %ext196%`r`n
records217400 = - %ext157%`r`n- %ext127%`r`n
records217700 = - %ext72%`r`n- %ext74%`r`n- %ext77%`r`n
records217800 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records217900 = - %ext71%`r`n- %ext74%`r`n
records218000 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records218100 = - %ext71%`r`n- %ext74%`r`n
records218200 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n- %ext77%`r`n
records218300 = - %ext71%`r`n- %ext74%`r`n
records218400 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n- %ext77%`r`n
records218500 = - %ext92%`r`n- %ext95%`r`n
records218600 = - %ext92%`r`n- %ext95%`r`n- %ext97%`r`n
records218700 = - %ext95%`r`n
records218800 = - %ext95%`r`n
records218900 = - %ext90%`r`n- %ext91%`r`n
records219100 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records219200 = - %ext72%`r`n- %ext74%`r`n- %ext77%`r`n
records219300 = - %ext71%`r`n- %ext72%`r`n- %ext73%`r`n- %ext74%`r`n
records219400 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records219500 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records219600 = - %ext78%`r`n- %ext180%`r`n
records219700 = - %ext74%`r`n- %ext181%`r`n
records219800 = - %ext71%`r`n- %ext73%`r`n- %ext74%`r`n
records219900 = - %ext74%`r`n- %ext78%`r`n
records220000 = - %ext71%`r`n- %ext74%`r`n
records220100 = - %ext74%`r`n
records220200 = - %ext97%`r`n
records220300 = - %ext97%`r`n
records220500 = - %ext97%`r`n
records220600 = - %ext92%`r`n- %ext93%`r`n- %ext97%`r`n
records220700 = - %ext91%`r`n- %ext92%`r`n- %ext93%`r`n- %ext94%`r`n
records220800 = - %ext91%`r`n- %ext92%`r`n- %ext93%`r`n- %ext94%`r`n- %ext96%`r`n
records220900 = - %ext28%`r`n- %ext30%`r`n- %ext41%`r`n- %ext45%`r`n
records221000 = - %ext71%`r`n- %ext72%`r`n- %ext74%`r`n
records221200 = - %ext56%`r`n- %ext129%`r`n
records221300 = - %ext56%`r`n- %ext129%`r`n
records221400 = - %ext56%`r`n- %ext129%`r`n
records221500 = - %ext57%`r`n
records221700 = - %ext60%`r`n
records221800 = - %ext61%`r`n- %ext129%`r`n
records221900 = - %ext61%`r`n- %ext129%`r`n
records222000 = - %ext56%`r`n- %ext58%`r`n- %ext62%`r`n- %ext63%`r`n
records222100 = - %ext56%`r`n- %ext62%`r`n- %ext63%`r`n
records222200 = - %ext56%`r`n
records222300 = - %ext9%`r`n
records222400 = - %ext9%`r`n
records222600 = - %ext6%`r`n
records222700 = - %ext132%`r`n
records222900 = - %ext132%`r`n
records223100 = - %ext6%`r`n
records223300 = - %ext1%`r`n
records223400 = - %ext1%`r`n
records223600 = - %ext8%`r`n
records223900 = - %ext1%`r`n
records224100 = - %ext17%`r`n
records224200 = - %ext17%`r`n
records224300 = - %ext14%`r`n
records224400 = - %ext156%`r`n
records224600 = - %ext19%`r`n
records224700 = - %ext137%`r`n
records225000 = - %ext11%`r`n- %ext132%`r`n
records225100 = - %ext1%`r`n- %ext6%`r`n
records225200 = - %ext25%`r`n- %ext28%`r`n
records225300 = - %ext25%`r`n- %ext28%`r`n
records225400 = - %ext25%`r`n- %ext134%`r`n
records225600 = - %ext57%`r`n
records225800 = - %ext57%`r`n
records226000 = - %ext25%`r`n- %ext28%`r`n- %ext127%`r`n
records226100 = - %ext25%`r`n- %ext28%`r`n- %ext127%`r`n
records226200 = - %ext25%`r`n- %ext28%`r`n
records226300 = - %ext25%`r`n- %ext127%`r`n
records226500 = - %ext25%`r`n- %ext28%`r`n- %ext32%`r`n- %ext33%`r`n- %ext62%`r`n- %ext127%`r`n
records226600 = - %ext28%`r`n- %ext34%`r`n- %ext127%`r`n
records226700 = - %ext25%`r`n- %ext28%`r`n- %ext36%`r`n- %ext127%`r`n
records226800 = - %ext157%`r`n- %ext28%`r`n- %ext127%`r`n
records227000 = - %ext194%`r`n
records227100 = - %ext25%`r`n- %ext34%`r`n- %ext127%`r`n
records227200 = - %ext25%`r`n- %ext34%`r`n
records227300 = - %ext25%`r`n- %ext27%`r`n- %ext28%`r`n- %ext34%`r`n- %ext127%`r`n
records227500 = - %ext133%`r`n
records227600 = - %ext25%`r`n- %ext27%`r`n- %ext28%`r`n- %ext127%`r`n
records227700 = - %ext25%`r`n- %ext27%`r`n- %ext28%`r`n- %ext32%`r`n- %ext127%`r`n
records227800 = - %ext23%`r`n
records227900 = - %ext48%`r`n
records228000 = - %ext25%`r`n- %ext127%`r`n
records228100 = - %ext25%`r`n- %ext28%`r`n- %ext36%`r`n- %ext127%`r`n
records228200 = - %ext25%`r`n- %ext27%`r`n- %ext28%`r`n- %ext32%`r`n- %ext127%`r`n
records228400 = - %ext25%`r`n- %ext34%`r`n
records228500 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n
records228800 = - %ext25%`r`n- %ext28%`r`n- %ext34%`r`n- %ext127%`r`n
records228900 = - %ext49%`r`n
records229000 = - %ext48%`r`n
records229100 = - %ext48%`r`n
records229200 = - %ext112%`r`n
records229300 = - %ext48%`r`n
records229400 = - %ext48%`r`n- %ext51%`r`n
records229500 = - %ext48%`r`n
records229600 = - %ext25%`r`n- %ext31%`r`n- %ext127%`r`n
records229700 = - %ext13%`r`n- %ext133%`r`n
records229800 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records229900 = - %ext157%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records230000 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records230100 = - %ext26%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records230200 = - %ext157%`r`n- %ext30%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records230500 = - %ext157%`r`n- %ext34%`r`n- %ext127%`r`n- %ext141%`r`n
records230600 = - %ext157%`r`n- %ext134%`r`n
records230800 = - %ext157%`r`n- %ext27%`r`n- %ext134%`r`n
records231000 = - %ext157%`r`n- %ext134%`r`n
records231200 = - %ext25%`r`n- %ext28%`r`n- %ext32%`r`n- %ext33%`r`n- %ext40%`r`n- %ext127%`r`n
records231300 = - %ext13%`r`n- %ext133%`r`n
records231400 = - %ext19%`r`n
records231600 = - %ext25%`r`n- %ext34%`r`n
records231700 = - %ext25%`r`n- %ext34%`r`n
records231800 = - %ext25%`r`n- %ext34%`r`n
records231900 = - %ext25%`r`n- %ext34%`r`n- %ext127%`r`n
records232000 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n
records232100 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n- %ext127%`r`n
records232200 = - %ext25%`r`n- %ext34%`r`n
records237200 = - %ext25%`r`n- %ext30%`r`n- %ext134%`r`n
records237300 = - %ext25%`r`n- %ext134%`r`n
records237400 = - %ext25%`r`n- %ext134%`r`n
records237500 = - %ext25%`r`n- %ext142%`r`n
records237700 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext134%`r`n
records237800 = - %ext25%`r`n- %ext134%`r`n
records237900 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records238200 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records238900 = - %ext25%`r`n- %ext28%`r`n- %ext32%`r`n- %ext127%`r`n
records239000 = - %ext157%`r`n- %ext32%`r`n- %ext127%`r`n
records239400 = - %ext25%`r`n- %ext134%`r`n
records239600 = - %ext196%`r`n- %ext197%`r`n- %ext198%`r`n
records239700 = - %ext25%`r`n- %ext142%`r`n
records240900 = - %ext25%`r`n- %ext32%`r`n- %ext33%`r`n- %ext139%`r`n
records241500 = - %ext1%`r`n
records241600 = - %ext151%`r`n- %ext152%`r`n
records241700 = - %ext133%`r`n
records242100 = - %ext48%`r`n
records242500 = - %ext48%`r`n
records242600 = - %ext56%`r`n- %ext129%`r`n
records242800 = - %ext137%`r`n
records242900 = - %ext108%`r`n- %ext194%`r`n- %ext199%`r`n
records244100 = - %ext200%`r`n- %ext194%`r`n- %ext199%`r`n
records244200 = - %ext11%`r`n
records244900 = - %ext25%`r`n- %ext31%`r`n- %ext127%`r`n
records245100 = - %ext35%`r`n
records245200 = - %ext41%`r`n
records245300 = - %ext25%`r`n- %ext32%`r`n- %ext34%`r`n- %ext134%`r`n
records245400 = - %ext25%`r`n- %ext34%`r`n
records245500 = - %ext25%`r`n- %ext30%`r`n- %ext37%`r`n- %ext38%`r`n- %ext44%`r`n
records245600 = - %ext25%`r`n- %ext37%`r`n- %ext38%`r`n
records245700 = - %ext190%`r`n
records245800 = - %ext81%`r`n
records245800 = - %ext80%`r`n- %ext86%`r`n- %ext207%`r`n- %ext83%`r`n
records245900 = - %ext81%`r`n- %ext84%`r`n- %ext87%`r`n- %ext208%`r`n
records246000 = - %ext81%`r`n- %ext84%`r`n- %ext85%`r`n- %ext86%`r`n- %ext205%`r`n- %ext211%`r`n
records246100 = - %ext81%`r`n- %ext84%`r`n- %ext204%`r`n- %ext205%`r`n- %ext206%`r`n
records246200 = - %ext81%`r`n- %ext205%`r`n- %ext206%`r`n- %ext203%`r`n
records246300 = - %ext81%`r`n- %ext86%`r`n- %ext205%`r`n- %ext203%`r`n- %ext206%`r`n
records246400 = - %ext80%`r`n- %ext81%`r`n- %ext83%`r`n- %ext203%`r`n
records246600 = - %ext56%`r`n
records246700 = - %ext47%`r`n- %ext48%`r`n- %ext135%`r`n
records246800 = - %ext47%`r`n- %ext48%`r`n- %ext135%`r`n
records246900 = - %ext135%`r`n
records247600 = - %ext25%`r`n- %ext27%`r`n
records247800 = - %ext25%`r`n
records247900 = - %ext25%`r`n
records249400 = - %ext25%`r`n- %ext35%`r`n
records249500 = - %ext25%`r`n- %ext27%`r`n- %ext35%`r`n
records249600 = - %ext25%`r`n- %ext27%`r`n- %ext30%`r`n- %ext35%`r`n
records249700 = - %ext25%`r`n- %ext27%`r`n- %ext34%`r`n- %ext35%`r`n
records249800 = - %ext25%`r`n- %ext27%`r`n- %ext38%`r`n
records249900 = - %ext25%`r`n- %ext34%`r`n
records250800 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records250900 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records251000 = - %ext95%`r`n
records251200 = - %ext97%`r`n
records251300 = - %ext92%`r`n- %ext93%`r`n- %ext97%`r`n
records251400 = - %ext91%`r`n- %ext92%`r`n
records252000 = - %ext90%`r`n- %ext92%`r`n- %ext95%`r`n- %ext97%`r`n
records252200 = - %ext97%`r`n- %ext99%`r`n
records252300 = - %ext97%`r`n- %ext99%`r`n
records252400 = - %ext97%`r`n- %ext99%`r`n
records252700 = - %ext97%`r`n- %ext99%`r`n
records252800 = - %ext25%`r`n- %ext27%`r`n- %ext29%`r`n
records253100 = - %ext25%`r`n- %ext27%`r`n- %ext127%`r`n
records253200 = - %ext25%`r`n- %ext27%`r`n
records253300 = - %ext25%`r`n- %ext27%`r`n
records253400 = - %ext27%`r`n
records514512 = - %ext26%`r`n- %ext33%`r`n- %ext36%`r`n- %ext39%`r`n
records5451221 = - %ext2%`r`n- %ext55%`r`n- %ext132%`r`n


If InStr(trimmedString, "/1100")
{

info0 = 01100 ; Product ID
info1 = Hanes Beefy-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info18 = 2.47
info17 = Heather colors are poly/cotton blend ; Product Exceptions

thisrecord1 = %records01100%
}

Else If InStr(trimmedString, "/04100")
{

info0 = 04100 ; Product ID
info1 = Gildan 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 193600 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather, Antique, Safety colors, Blackberry, Lilac, Midnight, Sunset, Tweed, and Russet are poly/cotton blends ; Product Exceptions
info18 = 1.55
thisrecord1 = %records04100%
}

Else If InStr(trimmedString, "/4600")
{

info0 = 4600 ; Product ID
info1 = Gildan Ultra Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 116800 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 133900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Ash, Sports Grey, Heather, Antique, and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 1.64
thisrecord1 = %records04600%
}

Else If InStr(trimmedString, "/4900")
{

info0 = 04900 ; Product ID
info1 = Gildan 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.64
thisrecord1 = %records04900%
}

Else If InStr(trimmedString, "/5100")
{

info0 = 05100 ; Product ID
info1 = Hanes Beefy-T Long Sleeve ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 5.34
thisrecord1 = %records05100%
}

Else If InStr(trimmedString, "/6100")
{

info0 = 06100 ; Product ID
info1 = Gildan Ultra Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 3.67
thisrecord1 = %records06100%
}

Else If InStr(trimmedString, "/7100")
{

info0 = 07100 ; Product ID
info1 = Augusta Ringer T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.95
thisrecord1 = %records07100%
}

Else If InStr(trimmedString, "/8000")
{

info0 = 08000 ; Product ID
info1 = Jerzees Sleeveless T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
thisrecord1 = %records08000%
}

Else If InStr(trimmedString, "/100000")
{

info0 = 100000 ; Product ID
info1 = Gildan Ultra Cotton Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab52 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.01
thisrecord1 = %records100000%
}

Else If InStr(trimmedString, "/100200")
{

info0 = 100200 ; Product ID
info1 = Yupoong Athletic Mesh Flexfit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab94 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.75
thisrecord1 = %records100200%
}

Else If InStr(trimmedString, "/100300")
{

info0 = 100300 ; Product ID
info1 = Yupoong Classic Trucker Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab93 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.48
thisrecord1 = %records100300%
}
Else If InStr(trimmedString, "/100400")
{

info0 = 100400 ; Product ID
info1 = Yupoong Cotton Twill Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab89 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.6
thisrecord1 = %records100400%
}

Else If InStr(trimmedString, "/100500")
{

info0 = 100500 ; Product ID
info1 = Hanes Ladies Tagless T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 116200 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Light Steel is a poly/cotton blend. ; Product Exceptions
info18 = 2.12
thisrecord1 = %records100500%
}

Else If InStr(trimmedString, "/101200")
{

info0 = 101200 ; Product ID
info1 = Large Polycarbonate Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab126 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records101200%
}

Else If InStr(trimmedString, "/10200")
{

info0 = 10200 ; Product ID
info1 = Hanes Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.25
thisrecord1 = %records10200%
}

Else If InStr(trimmedString, "/103600")
{

info0 = 103600 ; Product ID
info1 = Foldable Can Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab111 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records103600%
}

Else If InStr(trimmedString, "/103700")
{

info0 = 103700 ; Product ID
info1 = BIC Clic Stic Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records103700%
}

Else If InStr(trimmedString, "/103800")
{

info0 = 103800 ; Product ID
info1 = BIC Clic Stic Pen (blue ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records103800%
}

Else If InStr(trimmedString, "/103900")
{

info0 = 103900 ; Product ID
info1 = BIC Clic Stic Grip Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab131 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records103900%
}

Else If InStr(trimmedString, "/104000")
{

info0 = 104000 ; Product ID
info1 = BIC Clic Stic Grip Pen (blue ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab131 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records104000%
}

Else If InStr(trimmedString, "/104100")
{

info0 = 104100 ; Product ID
info1 = BIC XXL Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab132 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records104100%
}

Else If InStr(trimmedString, "/106700")
{

info0 = 106700 ; Product ID
info1 = 7.5 in. x 3.75 in. Rectangular Bumper Sticker ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab138 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records106700%
}

Else If InStr(trimmedString, "/106900")
{

info0 = 106900 ; Product ID
info1 = 11.5 in. x 3.75 in. Rectangular Bumper Sticker ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab138 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records106900%
}

Else If InStr(trimmedString, "/107200")
{

info0 = 107200 ; Product ID
info1 = Gildan Lightweight Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.8
thisrecord1 = %records107200%
}

Else If InStr(trimmedString, "/107300")
{

info0 = 107300 ; Product ID
info1 = Jerzees Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records107300%
}

Else If InStr(trimmedString, "/108200")
{

info0 = 108200 ; Product ID
info1 = Gildan Lightweight Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.54
thisrecord1 = %records108200%
}

Else If InStr(trimmedString, "/108600")
{

info0 = 108600 ; Product ID
info1 = 8.5 oz. Nuance Stemmed Glass ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records108600%
}

Else If InStr(trimmedString, "/108700")
{

info0 = 108700 ; Product ID
info1 = 5.75 oz. Nuance Flute ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records108700%
}

Else If InStr(trimmedString, "/108800")
{

info0 = 108800 ; Product ID
info1 = 15 oz. Glass Tankard ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records108800%
}

Else If InStr(trimmedString, "/108900")
{

info0 = 108900 ; Product ID
info1 = 1.5 oz. Tapered Glass ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records108900%
}

Else If InStr(trimmedString, "/109600")
{

info0 = 109600 ; Product ID
info1 = 16 oz. Mixing Glass ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records109600%
}

Else If InStr(trimmedString, "/109700")
{

info0 = 109700 ; Product ID
info1 = Chestnut Hill Microfleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab71 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records109700%
}

Else If InStr(trimmedString, "/109900")
{

info0 = 109900 ; Product ID
info1 = Chestnut Hill Ladies Microfleece Full-Zip Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat52 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab71 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records109900%
}

Else If InStr(trimmedString, "/110400")
{

info0 = 110400 ; Product ID
info1 = BIC Grip Roller Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records110400%
}

Else If InStr(trimmedString, "/110500")
{

info0 = 110500 ; Product ID
info1 = BIC Grip Roller Pen (blue ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records110500%
}

Else If InStr(trimmedString, "/110600")
{

info0 = 110600 ; Product ID
info1 = BIC Grip Roller Gold Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records110600%
}

Else If InStr(trimmedString, "/110800")
{

info0 = 110800 ; Product ID
info1 = BIC WideBody Metal Ball Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab133 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records110800%
}

Else If InStr(trimmedString, "/110900")
{

info0 = 110900 ; Product ID
info1 = 6 in. x 4 in. Oval Bumper Sticker ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab138 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records110900%
}

Else If InStr(trimmedString, "/111000")
{

info0 = 111000 ; Product ID
info1 = 3M Post-It Notes- 2.75" x 3" - 50 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111000%
}

Else If InStr(trimmedString, "/111100")
{

info0 = 111100 ; Product ID
info1 = 3M Post-It Notes- 2.75" x 3" - 100 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111100%
}

Else If InStr(trimmedString, "/111200")
{

info0 = 111200 ; Product ID
info1 = 3M Post-It Notes- 4" x 3" - 50 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111200%
}

Else If InStr(trimmedString, "/111300")
{

info0 = 111300 ; Product ID
info1 = 3M Post-It Notes- 4" x 3" - 100 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111300%
}

Else If InStr(trimmedString, "/111400")
{

info0 = 111400 ; Product ID
info1 = 3M Post-It Notes- 4" x 6" - 50 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111400%
}

Else If InStr(trimmedString, "/111500")
{

info0 = 111500 ; Product ID
info1 = 3M Post-It Notes- 4" x 6" - 100 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab136 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records111500%
}

Else If InStr(trimmedString, "/111900")
{

info0 = 111900 ; Product ID
info1 = Champion Fleece Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.66
thisrecord1 = %records111900%
}

Else If InStr(trimmedString, "/112100")
{

info0 = 112100 ; Product ID
info1 = Gildan Ultra Cotton Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.34
thisrecord1 = %records112100%
}

Else If InStr(trimmedString, "/112200")
{

info0 = 112200 ; Product ID
info1 = Harriton Men's Microfiber Windshirt ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab71 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records112200%
}

Else If InStr(trimmedString, "/112800")
{

info0 = 112800 ; Product ID
info1 = Augusta 2-Button Baseball Henley ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab28 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.45
thisrecord1 = %records112800%
}

Else If InStr(trimmedString, "/113100")
{

info0 = 113100 ; Product ID
info1 = Champion Gym Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab33 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6
thisrecord1 = %records113100%
}

Else If InStr(trimmedString, "/113300")
{

info0 = 113300 ; Product ID
info1 = Champion Tagless T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.48
thisrecord1 = %records113300%
}

Else If InStr(trimmedString, "/114900")
{

info0 = 114900 ; Product ID
info1 = Foldable Bottle Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab111 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records114900%
}

Else If InStr(trimmedString, "/116200")
{

info0 = 116200 ; Product ID
info1 = Hanes Tagless T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 100500 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 1.7
thisrecord1 = %records116200%
}

Else If InStr(trimmedString, "/116800")
{

info0 = 116800 ; Product ID
info1 = Gildan Ultra Cotton Ladies T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 4600 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 133900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 2.03
thisrecord1 = %records116800%
}

Else If InStr(trimmedString, "/116900")
{

info0 = 116900 ; Product ID
info1 = American Apparel 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 161600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.06
thisrecord1 = %records116900%
}

Else If InStr(trimmedString, "/117100")
{

info0 = 117100 ; Product ID
info1 = American Apparel Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab51 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather is a poly/cotton blend ; Product Exceptions
info18 = 20.87
thisrecord1 = %records117100%
}

Else If InStr(trimmedString, "/117700")
{

info0 = 117700 ; Product ID
info1 = Bic WideBody Retractable Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records117700%
}

Else If InStr(trimmedString, "/117800")
{

info0 = 117800 ; Product ID
info1 = Bic WideBody Retractable Pen (blue ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records117800%
}

Else If InStr(trimmedString, "/118300")
{

info0 = 118300 ; Product ID
info1 = Bic Pivo Twist Action Pen (black ink) ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records118300%
}

Else If InStr(trimmedString, "/118600")
{

info0 = 118600 ; Product ID
info1 = BIC Mechanical Pencil w/ Color Rubber Grip ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab129 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 300,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records118600%
}

Else If InStr(trimmedString, "/118700")
{

info0 = 118700 ; Product ID
info1 = BIC Esteem Pen ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab134 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records118700%
}

Else If InStr(trimmedString, "/118800")
{

info0 = 118800 ; Product ID
info1 = BIC Steel Retractable Pen ; Product Title
info2 := cat13 ; Product Category
info3 := subcat54 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab135 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample
thisrecord1 = %records118800%
}

Else If InStr(trimmedString, "/118900")
{

info0 = 118900 ; Product ID
info1 = Piccolo Mini Tote ; Product Title
info2 := cat11 ; Product Category
info3 := subcat42 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records118900%
}

Else If InStr(trimmedString, "/119000")
{

info0 = 119000 ; Product ID
info1 = Champion Tagless Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Light Steel is a poly/cotton blend ; Product Exceptions
info18 = 4.8
thisrecord1 = %records119000%
}

Else If InStr(trimmedString, "/119600")
{

info0 = 119600 ; Product ID
info1 = Gildan Lightweight 50/50 Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135800 ; Product Youth Adult ID
info16 = Stretchy elastic cuffs ; Product Comment One
info17 = Drawstring elastic waist (adult sizes only) ; Product Exceptions
info18 = 7.25
thisrecord1 = %records119600%
}

Else If InStr(trimmedString, "/119700")
{

info0 = 119700 ; Product ID
info1 = Gildan Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 181500 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 242500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.59
thisrecord1 = %records119700%
}

Else If InStr(trimmedString, "/119900")
{

info0 = 119900 ; Product ID
info1 = Hanes 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.39
thisrecord1 = %records119900%
}

Else If InStr(trimmedString, "/120000")
{

info0 = 120000 ; Product ID
info1 = Hanes Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.8
thisrecord1 = %records120000%
}

Else If InStr(trimmedString, "/121200")
{

info0 = 121200 ; Product ID
info1 = Hanes Ladies MidWeight Fleece Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records121200%
}

Else If InStr(trimmedString, "/121300")
{

info0 = 121300 ; Product ID
info1 = Hanes Ladies MidWeight Fleece Pants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records121300%
}

Else If InStr(trimmedString, "/121400")
{

info0 = 121400 ; Product ID
info1 = Small Polycarbonate Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab126 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records121400%
}

Else If InStr(trimmedString, "/121600")
{

info0 = 121600 ; Product ID
info1 = Large Ceramic Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat30 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab112 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records121600%
}

Else If InStr(trimmedString, "/121700")
{

info0 = 121700 ; Product ID
info1 = Bistro Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat30 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab112 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records121700%
}

Else If InStr(trimmedString, "/122000")
{

info0 = 122000 ; Product ID
info1 = 4 in. x 4 in. Square Static Stick Decal ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab139 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records122000%
}

Else If InStr(trimmedString, "/122100")
{

info0 = 122100 ; Product ID
info1 = 11.5 in. x 3 in. Rectangular Static Stick Decal ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab139 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records122100%
}

Else If InStr(trimmedString, "/122200")
{

info0 = 122200 ; Product ID
info1 = 6 in. x 4 in. Oval Static Stick Decal ; Product Title
info2 := cat13 ; Product Category
info3 := subcat56 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab139 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 250,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records122200%
}

Else If InStr(trimmedString, "/122500")
{

info0 = 122500 ; Product ID
info1 = Bella Juniors Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 178600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.78
thisrecord1 = %records122500%
}

Else If InStr(trimmedString, "/122600")
{

info0 = 122600 ; Product ID
info1 = Bella Juniors Crewneck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 178400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.71
thisrecord1 = %records122600%
}

Else If InStr(trimmedString, "/122700")
{

info0 = 122700 ; Product ID
info1 = Bella Juniors Cap Sleeve Raglan ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 124500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Deep Heather is a poly/cotton blend ; Product Exceptions
info18 = 4.27
thisrecord1 = %records122700%
}

Else If InStr(trimmedString, "/122800")
{

info0 = 122800 ; Product ID
info1 = Bella Juniors Raglan Crew ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.53
thisrecord1 = %records122800%
}

Else If InStr(trimmedString, "/122900")
{

info0 = 122900 ; Product ID
info1 = Bella Juniors Spaghetti Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records122900%
}

Else If InStr(trimmedString, "/123100")
{

info0 = 123100 ; Product ID
info1 = Bella Juniors Fleece Pant ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab78 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Straight wide bottom leg ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.1
thisrecord1 = %records123100%
}

Else If InStr(trimmedString, "/123200")
{

info0 = 123200 ; Product ID
info1 = Bella Juniors Long Sleeve Crew ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 178400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 6.69
thisrecord1 = %records123200%
}

Else If InStr(trimmedString, "/123900")
{

info0 = 123900 ; Product ID
info1 = Port and Company 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 160300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.81
thisrecord1 = %records123900%
}

Else If InStr(trimmedString, "/124200")
{

info0 = 124200 ; Product ID
info1 = Canvas Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 2.95
thisrecord1 = %records124200%
}

Else If InStr(trimmedString, "/124300")
{

info0 = 124300 ; Product ID
info1 = Canvas Long Sleeve Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 5.99
thisrecord1 = %records124300%
}

Else If InStr(trimmedString, "/124500")
{

info0 = 124500 ; Product ID
info1 = Canvas Long Sleeve Raglan ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 122700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.84
thisrecord1 = %records124500%
}

Else If InStr(trimmedString, "/125000")
{

info0 = 125000 ; Product ID
info1 = Anvil Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 166300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Neon colors are poly/cotton blends ; Product Exceptions
info18 = 1.84
thisrecord1 = %records125000%
}

Else If InStr(trimmedString, "/125700")
{

info0 = 125700 ; Product ID
info1 = Solid Frisbees ; Product Title
info2 := cat15 ; Product Category
info3 := subcat76 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab143 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records125700%
}

Else If InStr(trimmedString, "/125800")
{

info0 = 125800 ; Product ID
info1 = Transparent Frisbees ; Product Title
info2 := cat15 ; Product Category
info3 := subcat76 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab143 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records125800%
}

Else If InStr(trimmedString, "/125900")
{

info0 = 125900 ; Product ID
info1 = Foldable Neoprene Can Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab120 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records125900%
}

Else If InStr(trimmedString, "/126000")
{

info0 = 126000 ; Product ID
info1 = Foldable Foam Zipper Bottle Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab111 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records126000%
}

Else If InStr(trimmedString, "/126100")
{

info0 = 126100 ; Product ID
info1 = Bic Mouse Pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat58 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab128 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records126100%
}

Else If InStr(trimmedString, "/127300")
{

info0 = 127300 ; Product ID
info1 = Anvil Organic T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.63
thisrecord1 = %records127300%
}

Else If InStr(trimmedString, "/127700")
{

info0 = 127700 ; Product ID
info1 = Otto Caps Foam/Mesh Baseball Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab95 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185700 ; Product Youth Adult ID
info16 = %ext209% ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.4
thisrecord1 = %records127700%
}

Else If InStr(trimmedString, "/127900")
{

info0 = 127900 ; Product ID
info1 = Foam Can Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab114 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 90,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records127900%
}

Else If InStr(trimmedString, "/129500")
{

info0 = 129500 ; Product ID
info1 = Jerzees 50/50 Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.36
thisrecord1 = %records129500%
}

Else If InStr(trimmedString, "/129800")
{

info0 = 129800 ; Product ID
info1 = Jerzees 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.71
thisrecord1 = %records129800%
}

Else If InStr(trimmedString, "/130900")
{

info0 = 130900 ; Product ID
info1 = Jerzees 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 202800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.2
thisrecord1 = %records130900%
}

Else If InStr(trimmedString, "/131100")
{

info0 = 131100 ; Product ID
info1 = Hanes Long Sleeve Tagless T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 136900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 5.08
thisrecord1 = %records131100%
}

Else If InStr(trimmedString, "/131200")
{

info0 = 131200 ; Product ID
info1 = Hanes Fleece Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Dyed-to-match drawcord ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.57
thisrecord1 = %records131200%
}

Else If InStr(trimmedString, "/133000")
{

info0 = 133000 ; Product ID
info1 = 18 oz Triton Mate Water Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab123 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records133000%
}

Else If InStr(trimmedString, "/133900")
{

info0 = 133900 ; Product ID
info1 = Gildan Youth Ultra Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 4600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Ash, Sports Grey and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 1.66
thisrecord1 = %records133900%
}

Else If InStr(trimmedString, "/134000")
{

info0 = 134000 ; Product ID
info1 = Gildan Youth 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 04100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 1.49
thisrecord1 = %records134000%
}

Else If InStr(trimmedString, "/134100")
{

info0 = 134100 ; Product ID
info1 = Gildan Youth 50/50 T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 4900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.67
thisrecord1 = %records134100%
}

Else If InStr(trimmedString, "/134300")
{

info0 = 134300 ; Product ID
info1 = American Apparel Youth Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 15000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 4.4
thisrecord1 = %records134300%
}

Else If InStr(trimmedString, "/134500")
{

info0 = 134500 ; Product ID
info1 = Hanes Youth Tagless T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 116200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 1.67
thisrecord1 = %records134500%
}

Else If InStr(trimmedString, "/135000")
{

info0 = 135000 ; Product ID
info1 = Port and Company Youth 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 123900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.5
thisrecord1 = %records135000%
}

Else If InStr(trimmedString, "/135100")
{

info0 = 135100 ; Product ID
info1 = Gildan Youth Ultra Cotton Long Sleeve T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 6100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 3.38
thisrecord1 = %records135100%
}

Else If InStr(trimmedString, "/135200")
{

info0 = 135200 ; Product ID
info1 = Jerzees Youth 50/50 Long Sleeve T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 129500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.44
thisrecord1 = %records135200%
}

Else If InStr(trimmedString, "/135300") ; one
{

info0 = 135300 ; Product ID
info1 = Gildan Youth Lightweight Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 108200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.42
thisrecord1 = %records135300%
}

Else If InStr(trimmedString, "/135400")
{

info0 = 135400 ; Product ID
info1 = Jerzees Youth 50/50 Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 129800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.63
thisrecord1 = %records135400%
}

Else If InStr(trimmedString, "/135500")
{

info0 = 135500 ; Product ID
info1 = Gildan Youth Lightweight Crewneck Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat81 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 107200 ; Product Youth Adult ID
info16 = Pill-resistant, air-spun fabric ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.31
thisrecord1 = %records135500%
}

Else If InStr(trimmedString, "/135600")
{

info0 = 135600 ; Product ID
info1 = Jerzees Youth Crewneck Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat81 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 107300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records135600%
}

Else If InStr(trimmedString, "/135700")
{

info0 = 135700 ; Product ID
info1 = Jerzees Youth Zip Hoodie ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 99600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.76
thisrecord1 = %records135700%
}

Else If InStr(trimmedString, "/135800")
{

info0 = 135800 ; Product ID
info1 = Gildan Youth Lightweight 50/50 Sweatpants ; Product Title
info2 := cat8 ; Product Category
info3 := subcat92 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 119600 ; Product Youth Adult ID
info16 = Stretchy elastic cuffs ; Product Comment One
info17 = Drawstring elastic waist (adult sizes only) ; Product Exceptions
info18 = 6.71
thisrecord1 = %records135800%
}

Else If InStr(trimmedString, "/136000")
{

info0 = 136000 ; Product ID
info1 = Soffe Youth Cheer Shorts ; Product Title
info2 := cat8 ; Product Category
info3 := subcat82 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab28 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 96000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records136000%
}

Else If InStr(trimmedString, "/136300")
{

info0 = 136300 ; Product ID
info1 = Hanes Youth Zip Hoodie ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.53
thisrecord1 = %records136300%
}

Else If InStr(trimmedString, "/136900")
{

info0 = 136900 ; Product ID
info1 = Hanes Ladies Tagless Long Sleeve T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Light steel is a poly/cotton blend ; Product Exceptions
thisrecord1 = %records136900%
}

Else If InStr(trimmedString, "/137000")
{

info0 = 137000 ; Product ID
info1 = Hanes Ladies Tagless V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 116200 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Light Steel is a poly/cotton blend. ; Product Exceptions
info18 = 3.69
thisrecord1 = %records137000%
}

Else If InStr(trimmedString, "/137800")
{

info0 = 137800 ; Product ID
info1 = Sport-Tek Dri-Mesh Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab41 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records137800%
}

Else If InStr(trimmedString, "/137900")
{

info0 = 137900 ; Product ID
info1 = Sport-Tek Dri-Mesh Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab41 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records137900%
}

Else If InStr(trimmedString, "/138400")
{

info0 = 138400 ; Product ID
info1 = Champion Ladies Active Mesh Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.5
thisrecord1 = %records138400%
}

Else If InStr(trimmedString, "/138600")
{

info0 = 138600 ; Product ID
info1 = Sport-Tek Baseball Raglan ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab33 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 158300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.49
thisrecord1 = %records138600%
}

Else If InStr(trimmedString, "/138700")
{

info0 = 138700 ; Product ID
info1 = Hanes Beefy-T w/ Pocket ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = heather colors are poly/cotton blend ; Product Exceptions
info18 = 4.8
thisrecord1 = %records138700%
}

Else If InStr(trimmedString, "/138800")
{

info0 = 138800 ; Product ID
info1 = Jerzees 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 203100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 158600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.68
thisrecord1 = %records138800%
}

Else If InStr(trimmedString, "/139200")
{

info0 = 139200 ; Product ID
info1 = 24 oz Triton Mate Water Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab123 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records139200%
}

Else If InStr(trimmedString, "/139900")
{

info0 = 139900 ; Product ID
info1 = Hanes Toddler Tagless T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Light Steel is a poly/cotton blend ; Product Exceptions
info18 = 2.33
thisrecord1 = %records139900%
}

Else If InStr(trimmedString, "/140400")
{

info0 = 140400 ; Product ID
info1 = Rabbit Skins Toddler T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.11
thisrecord1 = %records140400%
}

Else If InStr(trimmedString, "/140600")
{

info0 = 140600 ; Product ID
info1 = Rabbit Skins Infant T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.11
thisrecord1 = %records140600%
}

Else If InStr(trimmedString, "/140700")
{

info0 = 140700 ; Product ID
info1 = Rabbit Skins Infant Lap Shoulder T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.22
thisrecord1 = %records140700%
}

Else If InStr(trimmedString, "/140800")
{

info0 = 140800 ; Product ID
info1 = Rabbit Skins Infant Romper ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 4.4
thisrecord1 = %records140800%
}

Else If InStr(trimmedString, "/141000")
{

info0 = 141000 ; Product ID
info1 = Bella Infant One-piece ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
thisrecord1 = %records141000%
}

Else If InStr(trimmedString, "/141500")
{

info0 = 141500 ; Product ID
info1 = Gildan Ultra Cotton Long Sleeve Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 5.46
thisrecord1 = %records141500%
}

Else If InStr(trimmedString, "/141600")
{

info0 = 141600 ; Product ID
info1 = Bella Juniors Long Sleeve Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.99
thisrecord1 = %records141600%
}

Else If InStr(trimmedString, "/141800")
{

info0 = 141800 ; Product ID
info1 = Gildan 50/50 Open Bottom Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.56
thisrecord1 = %records141800%
}

Else If InStr(trimmedString, "/15000")
{

info0 = 15000 ; Product ID
info1 = American Apparel Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 30000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 4.52
thisrecord1 = %records15000%
}

Else If InStr(trimmedString, "/150000")
{

info0 = 150000 ; Product ID
info1 = Canada - Gildan Ultra Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 153300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 153500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.05
thisrecord1 = %records150000%
}

Else If InStr(trimmedString, "/150200")
{

info0 = 150200 ; Product ID
info1 = Canada - Gildan 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 196900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 167600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 1.92
thisrecord1 = %records150200%
}

Else If InStr(trimmedString, "/150600")
{

info0 = 150600 ; Product ID
info1 = Canada - American Apparel Juniors Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 152100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.47
thisrecord1 = %records150600%
}

Else If InStr(trimmedString, "/151000")
{

info0 = 151000 ; Product ID
info1 = Canada - American Apparel Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 152100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 5.47
thisrecord1 = %records151000%
}

Else If InStr(trimmedString, "/151300")
{

info0 = 151300 ; Product ID
info1 = Canada - Gildan Ultra Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 164000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 4.26
thisrecord1 = %records151300%
}

Else If InStr(trimmedString, "/151600")
{

info0 = 151600 ; Product ID
info1 = Canada - Gildan 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 155400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.02
thisrecord1 = %records151600%
}

Else If InStr(trimmedString, "/152100")
{

info0 = 152100 ; Product ID
info1 = Canada - American Apparel Youth Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 151000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 5.07
thisrecord1 = %records152100%
}

Else If InStr(trimmedString, "/152600")
{

info0 = 152600 ; Product ID
info1 = Canada - Gildan Lightweight Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 228900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6
thisrecord1 = %records152600%
}

Else If InStr(trimmedString, "/153100")
{

info0 = 153100 ; Product ID
info1 = Canada - American Apparel 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.88
thisrecord1 = %records153100%
}

Else If InStr(trimmedString, "/153200")
{

info0 = 153200 ; Product ID
info1 = Canada - American Apparel Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 6.14
thisrecord1 = %records153200%
}

Else If InStr(trimmedString, "/153300")
{

info0 = 153300 ; Product ID
info1 = Canada - Gildan Ultra Cotton Ladies T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 150000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 153500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 2.25
thisrecord1 = %records153300%
}

Else If InStr(trimmedString, "/153400")
{

info0 = 153400 ; Product ID
info1 = Canada - Gildan Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 229100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 242100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.39
thisrecord1 = %records153400%
}

Else If InStr(trimmedString, "/153500")
{

info0 = 153500 ; Product ID
info1 = Canada - Gildan Youth Ultra Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 150000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Safety and Heather colors are poly/cotton blends ; Product Exceptions
info18 = 2.03
thisrecord1 = %records153500%
}

Else If InStr(trimmedString, "/155400")
{

info0 = 155400 ; Product ID
info1 = Canada - Gildan Youth 50/50 T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 151600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.09
thisrecord1 = %records155400%
}

Else If InStr(trimmedString, "/157500")
{

info0 = 157500 ; Product ID
info1 = Canada - American Apparel Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 7.1
thisrecord1 = %records157500%
}

Else If InStr(trimmedString, "/157800")
{

info0 = 157800 ; Product ID
info1 = Port Authority Grommeted Golf Towel ; Product Title
info2 := cat15 ; Product Category
info3 := subcat77 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab144 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.49
thisrecord1 = %records157800%
}

Else If InStr(trimmedString, "/158000")
{

info0 = 158000 ; Product ID
info1 = Jerzees Lightweight 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 158500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 1.88
thisrecord1 = %records158000%
}

Else If InStr(trimmedString, "/158100")
{

info0 = 158100 ; Product ID
info1 = Jerzees Lightweight 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.73
thisrecord1 = %records158100%
}

Else If InStr(trimmedString, "/158300")
{

info0 = 158300 ; Product ID
info1 = Sport-Tek Youth Baseball Raglan ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab33 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 138600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.19
thisrecord1 = %records158300%
}

Else If InStr(trimmedString, "/158500")
{

info0 = 158500 ; Product ID
info1 = Jerzees Youth Lightweight 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 158000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.11
thisrecord1 = %records158500%
}

Else If InStr(trimmedString, "/158600")
{

info0 = 158600 ; Product ID
info1 = Jerzees Youth 50/50 T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 138800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.67
thisrecord1 = %records158600%
}

Else If InStr(trimmedString, "/159400")
{

info0 = 159400 ; Product ID
info1 = Sportsman Two-Tone Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab91 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.75
thisrecord1 = %records159400%
}

Else If InStr(trimmedString, "/159500")
{

info0 = 159500 ; Product ID
info1 = Valucap Bio-Washed Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab79 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2
thisrecord1 = %records159500%
}

Else If InStr(trimmedString, "/159700")
{

info0 = 159700 ; Product ID
info1 = Jerzees Spotshield 50/50 Long Sleeve Jersey Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.03
thisrecord1 = %records159700%
}

Else If InStr(trimmedString, "/159800")
{

info0 = 159800 ; Product ID
info1 = Code 5 Digital Camo T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.45
thisrecord1 = %records159800%
}

Else If InStr(trimmedString, "/159900")
{

info0 = 159900 ; Product ID
info1 = Port Authority Silk Touch Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab57 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 160000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.49
thisrecord1 = %records159900%
}

Else If InStr(trimmedString, "/160000")
{

info0 = 160000 ; Product ID
info1 = Port Authority Ladies Silk Touch Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab57 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 159900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.49
thisrecord1 = %records160000%
}

Else If InStr(trimmedString, "/160300")
{

info0 = 160300 ; Product ID
info1 = Port and Company Ladies T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 123900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Athletic Heather is a poly/cotton blend ; Product Exceptions
info18 = 2.59
thisrecord1 = %records160300%
}

Else If InStr(trimmedString, "/160600")
{

info0 = 160600 ; Product ID
info1 = 25 oz. Aluminum Water Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab124 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 80,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records160600%
}

Else If InStr(trimmedString, "/160700")
{

info0 = 160700 ; Product ID
info1 = Badger B-Dry Contrast Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Textured mesh contrast side and sleeve panels ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.95
thisrecord1 = %records160700%
}

Else If InStr(trimmedString, "/160800")
{

info0 = 160800 ; Product ID
info1 = Badger B-Dry Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 160900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.57
thisrecord1 = %records160800%
}

Else If InStr(trimmedString, "/160900")
{

info0 = 160900 ; Product ID
info1 = Badger B-Dry Ladies Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 160800 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.85
thisrecord1 = %records160900%
}

Else If InStr(trimmedString, "/161000")
{

info0 = 161000 ; Product ID
info1 = Badger B-Dry Performance Baseball Henley ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records161000%
}

Else If InStr(trimmedString, "/161100")
{

info0 = 161100 ; Product ID
info1 = Badger B-Dry Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.3
thisrecord1 = %records161100%
}

Else If InStr(trimmedString, "/161300")
{

info0 = 161300 ; Product ID
info1 = Small Plastic Stadium Cup ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab113 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records161300%
}

Else If InStr(trimmedString, "/161600")
{

info0 = 161600 ; Product ID
info1 = American Apparel Juniors 50/50 T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 116900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.53
thisrecord1 = %records161600%
}

Else If InStr(trimmedString, "/161700")
{

info0 = 161700 ; Product ID
info1 = Canvas Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.57
thisrecord1 = %records161700%
}

Else If InStr(trimmedString, "/162000")
{

info0 = 162000 ; Product ID
info1 = Badger B-Dry Contrast Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Textured mesh contrast side and sleeve panels  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.1
thisrecord1 = %records162000%
}

Else If InStr(trimmedString, "/162300")
{

info0 = 162300 ; Product ID
info1 = Bella Juniors V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 4.52
thisrecord1 = %records162300%
}

Else If InStr(trimmedString, "/162400")
{

info0 = 162400 ; Product ID
info1 = Code 5 Camo T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 163400 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.45
thisrecord1 = %records162400%
}

Else If InStr(trimmedString, "/163400")
{

info0 = 163400 ; Product ID
info1 = Code 5 Youth Camo T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 162400 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.1
thisrecord1 = %records163400%
}

Else If InStr(trimmedString, "/163600")
{

info0 = 163600 ; Product ID
info1 = Port Authority Youth Silk Touch Polo ; Product Title
info2 := cat8 ; Product Category
info3 := subcat79 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab57 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 159900 ; Product Youth Adult ID
info16 = Metal buttons with dyed-to-match rims, Lay flat collar  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.49
thisrecord1 = %records163600%
}

Else If InStr(trimmedString, "/163700")
{

info0 = 163700 ; Product ID
info1 = Valucap Youth Bio-Washed Hat ; Product Title
info2 := cat8 ; Product Category
info3 := subcat78 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab79 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 159500 ; Product Youth Adult ID
info16 = Low-profile, 6 panel hat with pre-curved visor`r`n- Adjustable self-fabric back with buckle closure  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.46
thisrecord1 = %records163700%
}

Else If InStr(trimmedString, "/163800")
{

info0 = 163800 ; Product ID
info1 = Hanes Youth 50/50 Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 119900 ; Product Youth Adult ID
info16 = EcoSmart fabric made with up to 5`% recycled plastic waterbottles  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.83
thisrecord1 = %records163800%
}

Else If InStr(trimmedString, "/163900")
{

info0 = 163900 ; Product ID
info1 = Badger Youth B-Dry Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 160800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.75
thisrecord1 = %records163900%
}

Else If InStr(trimmedString, "/164000")
{

info0 = 164000 ; Product ID
info1 = Canada - Gildan Youth Ultra Cotton Long Sleeve T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 151300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 4.27
thisrecord1 = %records164000%
}

Else If InStr(trimmedString, "/164100")
{

info0 = 164100 ; Product ID
info1 = 20 oz. Bike Water Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab117 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records164100%
}

Else If InStr(trimmedString, "/164200")
{

info0 = 164200 ; Product ID
info1 = 24 oz. Bike Water Bottle ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab117 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records164200%
}

Else If InStr(trimmedString, "/164300")
{

info0 = 164300 ; Product ID
info1 = Port and Company Tote ; Product Title
info2 := cat11 ; Product Category
info3 := subcat42 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.79
thisrecord1 = %records164300%
}

Else If InStr(trimmedString, "/164500")
{

info0 = 164500 ; Product ID
info1 = Basic Backpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,3 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records164500%
}

Else If InStr(trimmedString, "/165200")
{

info0 = 165200 ; Product ID
info1 = Colorblock Fleece and Nylon Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab67 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 22
thisrecord1 = %records165200%
}

Else If InStr(trimmedString, "/165500")
{

info0 = 165500 ; Product ID
info1 = Mood Stadium Cup ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab122 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records165500%
}

Else If InStr(trimmedString, "/165600")
{

info0 = 165600 ; Product ID
info1 = Champion Short Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab40 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 165900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 170600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.25
thisrecord1 = %records165600%
}

Else If InStr(trimmedString, "/165700")
{

info0 = 165700 ; Product ID
info1 = Champion Contrast Stitch Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab41 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10
thisrecord1 = %records165700%
}

Else If InStr(trimmedString, "/165800")
{

info0 = 165800 ; Product ID
info1 = Champion Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab35 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.17
thisrecord1 = %records165800%
}

Else If InStr(trimmedString, "/165900")
{

info0 = 165900 ; Product ID
info1 = Champion Ladies V-Neck Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab40 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 165600 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 170600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.6
thisrecord1 = %records165900%
}

Else If InStr(trimmedString, "/166000")
{

info0 = 166000 ; Product ID
info1 = Sport-Tek Long Sleeve Performance Raglan ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = subtle contrast stitching ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records166000%
}

Else If InStr(trimmedString, "/166200")
{

info0 = 166200 ; Product ID
info1 = Anvil Sustainable T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.59
thisrecord1 = %records166200%
}

Else If InStr(trimmedString, "/166300")
{

info0 = 166300 ; Product ID
info1 = Anvil Ladies Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 125000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 2.69
thisrecord1 = %records166300%
}

Else If InStr(trimmedString, "/166400")
{

info0 = 166400 ; Product ID
info1 = Augusta Double Sleeve Stripe Jersey T-shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab28 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.57
thisrecord1 = %records166400%
}

Else If InStr(trimmedString, "/166700")
{

info0 = 166700 ; Product ID
info1 = Badger B-Dry Sleeveless Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.85
thisrecord1 = %records166700%
}

Else If InStr(trimmedString, "/166800")
{

info0 = 166800 ; Product ID
info1 = Full Color Photo Can Cooler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab111 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,8 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records166800%
}

Else If InStr(trimmedString, "/167200")
{

info0 = 167200 ; Product ID
info1 = Canada - Bella Juniors Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.9
thisrecord1 = %records167200%
}

Else If InStr(trimmedString, "/167600")
{

info0 = 167600 ; Product ID
info1 = Canada - Gildan Youth 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 150200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 1.89
thisrecord1 = %records167600%
}

Else If InStr(trimmedString, "/167800")
{

info0 = 167800 ; Product ID
info1 = Augusta Short Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 204700 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 170700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.28
thisrecord1 = %records167800%
}

Else If InStr(trimmedString, "/168000")
{

info0 = 168000 ; Product ID
info1 = Canada - Gildan Ultra Cotton Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 4.38
thisrecord1 = %records168000%
}

Else If InStr(trimmedString, "/168200")
{

info0 = 168200 ; Product ID
info1 = Canada - Gildan Lightweight 50/50 Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 168300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.04
thisrecord1 = %records168200%
}

Else If InStr(trimmedString, "/168300")
{

info0 = 168300 ; Product ID
info1 = Canada - Gildan Youth Lightweight 50/50 Sweatpants ; Product Title
info2 := cat8 ; Product Category
info3 := subcat92 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 168200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.71
thisrecord1 = %records168300%
}

Else If InStr(trimmedString, "/168500")
{

info0 = 168500 ; Product ID
info1 = Canada - Gildan Lightweight Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 168600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.38
thisrecord1 = %records168500%
}

Else If InStr(trimmedString, "/168600")
{

info0 = 168600 ; Product ID
info1 = Canada - Gildan Youth Lightweight Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 168500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.07
thisrecord1 = %records168600%
}

Else If InStr(trimmedString, "/168700")
{

info0 = 168700 ; Product ID
info1 = Sport-Tek Colorblock Performance Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.49
thisrecord1 = %records168700%
}

Else If InStr(trimmedString, "/168900")
{

info0 = 168900 ; Product ID
info1 = J. America Vintage Track Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab28 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Custom raw-seam edges for a worn in look ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.25
thisrecord1 = %records168900%
}

Else If InStr(trimmedString, "/169000")
{

info0 = 169000 ; Product ID
info1 = Independent Trading Lightweight Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.5
thisrecord1 = %records169000%
}

Else If InStr(trimmedString, "/169200")
{

info0 = 169200 ; Product ID
info1 = Sport-Tek Full-Zip Hooded Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 171000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records169200%
}

Else If InStr(trimmedString, "/169300")
{

info0 = 169300 ; Product ID
info1 = Sport-Tek V-Neck Windshirt ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records169300%
}

Else If InStr(trimmedString, "/169400")
{

info0 = 169400 ; Product ID
info1 = Sport-Tek Colorblock 1/4 Zip Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Inner Jersey Lining and left side seam zipper  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records169400%
}

Else If InStr(trimmedString, "/169500")
{

info0 = 169500 ; Product ID
info1 = Sport-Tek Tipped V-Neck Windshirt ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = Sport-Tek Tipped V-Neck Windshirt
thisrecord1 = %records169500%
}

Else If InStr(trimmedString, "/169600")
{

info0 = 169600 ; Product ID
info1 = Sport-Tek Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records169600%
}

Else If InStr(trimmedString, "/169700")
{

info0 = 169700 ; Product ID
info1 = Adidas Three Stripe Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab36 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.74
thisrecord1 = %records169700%
}

Else If InStr(trimmedString, "/169800")
{

info0 = 169800 ; Product ID
info1 = Hanes 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 171300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.65
thisrecord1 = %records169800%
}

Else If InStr(trimmedString, "/169900")
{

info0 = 169900 ; Product ID
info1 = American Apparel Tri-Blend T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 187200 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.1
thisrecord1 = %records169900%
}

Else If InStr(trimmedString, "/170000")
{

info0 = 170000 ; Product ID
info1 = Canvas Long Sleeve Thermal ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.5
thisrecord1 = %records170000%
}

Else If InStr(trimmedString, "/170200")
{

info0 = 170200 ; Product ID
info1 = Bella Juniors Long Sleeve Thermal ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.7
thisrecord1 = %records170200%
}

Else If InStr(trimmedString, "/170600")
{

info0 = 170600 ; Product ID
info1 = Champion Youth Short Sleeve Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab40 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 165600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.8
thisrecord1 = %records170600%
}

Else If InStr(trimmedString, "/170700")
{

info0 = 170700 ; Product ID
info1 = Augusta Youth Short Sleeve Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 167800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.66
thisrecord1 = %records170700%
}

Else If InStr(trimmedString, "/171000")
{

info0 = 171000 ; Product ID
info1 = Sport-Tek Youth Full-Zip Hooded Jacket ; Product Title
info2 := cat8 ; Product Category
info3 := subcat90 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 169200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.99
thisrecord1 = %records171000%
}

Else If InStr(trimmedString, "/171100")
{

info0 = 171100 ; Product ID
info1 = Sport-Tek Youth V-Neck Windshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat91 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1 ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 169300 ; Product Youth Adult ID
info16 = Left side seam zipper for easy on/off  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records171100%
}

Else If InStr(trimmedString, "/171200")
{

info0 = 171200 ; Product ID
info1 = Sport-Tek Youth Tipped V-Neck Windshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat91 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 169500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records171200%
}

Else If InStr(trimmedString, "/171300")
{

info0 = 171300 ; Product ID
info1 = Hanes Youth 50/50 T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 169800 ; Product Youth Adult ID
info16 = EcoSmart fabric made with up to 5`% recycled plastic waterbottles  ; Product Comment One
info18 = 1.65
info17 = empty ; Product Exceptions
thisrecord1 = %records171300%
}

Else If InStr(trimmedString, "/171500")
{

info0 = 171500 ; Product ID
info1 = Lunch Cooler ; Product Title
info2 := cat11 ; Product Category
info3 := subcat45 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab102 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Room for a 6 pack and more ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records171500%
}

Else If InStr(trimmedString, "/171700")
{

info0 = 171700 ; Product ID
info1 = 16 oz. Acrylic Cafe Tumbler ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab125 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records171700%
}

Else If InStr(trimmedString, "/172100")
{

info0 = 172100 ; Product ID
info1 = Next Level Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172500 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 3.01
thisrecord1 = %records172100%
}

Else If InStr(trimmedString, "/172300")
{

info0 = 172300 ; Product ID
info1 = Next Level 60/40 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab9 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = All colors have subtle heathered appearance except White, Black and Ash ; Product Exceptions
info18 = 3.16
thisrecord1 = %records172300%
}

Else If InStr(trimmedString, "/172500")
{

info0 = 172500 ; Product ID
info1 = Next Level Juniors Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 179000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 2.73
thisrecord1 = %records172500%
}

Else If InStr(trimmedString, "/172600")
{

info0 = 172600 ; Product ID
info1 = Next Level Juniors Lightweight V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.3
thisrecord1 = %records172600%
}

Else If InStr(trimmedString, "/172700")
{

info0 = 172700 ; Product ID
info1 = Next Level Juniors 60/40 T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.94
thisrecord1 = %records172700%
}

Else If InStr(trimmedString, "/172800")
{

info0 = 172800 ; Product ID
info1 = Bella Juniors Favorite T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 2.72
thisrecord1 = %records172800%
}

Else If InStr(trimmedString, "/172900")
{

info0 = 172900 ; Product ID
info1 = Bella Ladies Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 124200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.99
thisrecord1 = %records172900%
}

Else If InStr(trimmedString, "/173100")
{

info0 = 173100 ; Product ID
info1 = Bella Ladies V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.79
thisrecord1 = %records173100%
}

Else If InStr(trimmedString, "/173200")
{

info0 = 173200 ; Product ID
info1 = Cinchpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab107 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.83
thisrecord1 = %records173200%
}

Else If InStr(trimmedString, "/173800")
{

info0 = 173800 ; Product ID
info1 = Sport-Tek Micro-Mesh Reversible Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab61 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185100 ; Product Youth Adult ID
info16 = Outside locker label  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.99
thisrecord1 = %records173800%
}

Else If InStr(trimmedString, "/174000")
{

info0 = 174000 ; Product ID
info1 = Sport-Tek 1/4 Zip Performance Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Contrast color lining inside collar  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records174000%
}

Else If InStr(trimmedString, "/174100")
{

info0 = 174100 ; Product ID
info1 = Badger Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 20.11
thisrecord1 = %records174100%
}

Else If InStr(trimmedString, "/174200")
{

info0 = 174200 ; Product ID
info1 = J. America Hockey Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 181700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15
thisrecord1 = %records174200%
}

Else If InStr(trimmedString, "/174900")
{

info0 = 174900 ; Product ID
info1 = Sport-Tek Micro-Mesh Reversible Sleeveless Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab61 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185300 ; Product Youth Adult ID
info16 = Create a team uniform by pairing with the Sport-Tek Micro-Mesh Reversible Contrast Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records174900%
}

Else If InStr(trimmedString, "/175000")
{

info0 = 175000 ; Product ID
info1 = Sport-Tek Micro-Mesh Reversible Contrast Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Comfortable elastic waistband with drawcord (adult sizes only) ; Product Exceptions
info18 = 7.99
thisrecord1 = %records175000%
}

Else If InStr(trimmedString, "/175200")
{

info0 = 175200 ; Product ID
info1 = Bayside 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 5.42
thisrecord1 = %records175200%
}

Else If InStr(trimmedString, "/175300")
{

info0 = 175300 ; Product ID
info1 = Bayside Lightweight 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.85
thisrecord1 = %records175300%
}

Else If InStr(trimmedString, "/175600")
{

info0 = 175600 ; Product ID
info1 = Anvil Ladies Lightweight Scoop Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.7
thisrecord1 = %records175600%
}

Else If InStr(trimmedString, "/175700")
{

info0 = 175700 ; Product ID
info1 = Anvil Ladies Lightweight V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.7
thisrecord1 = %records175700%
}

Else If InStr(trimmedString, "/175800")
{

info0 = 175800 ; Product ID
info1 = Comfort Colors 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.06
thisrecord1 = %records175800%
}

Else If InStr(trimmedString, "/175900")
{

info0 = 175900 ; Product ID
info1 = Comfort Colors 100`% Cotton Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.53
thisrecord1 = %records175900%
}

Else If InStr(trimmedString, "/176000")
{

info0 = 176000 ; Product ID
info1 = Hanes Nano-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 176900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 208400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 1.84
thisrecord1 = %records176000%
}

Else If InStr(trimmedString, "/176100")
{

info0 = 176100 ; Product ID
info1 = Gildan Softstyle Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.84
thisrecord1 = %records176100%
}

Else If InStr(trimmedString, "/176200")
{

info0 = 176200 ; Product ID
info1 = Canvas Lightweight Jersey Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records176200%
}

Else If InStr(trimmedString, "/176300")
{

info0 = 176300 ; Product ID
info1 = Hanes 50/50 Jersey Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab54 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.38
thisrecord1 = %records176300%
}

Else If InStr(trimmedString, "/176400")
{

info0 = 176400 ; Product ID
info1 = Badger Drive Contrast Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Textured mesh contrast side and sleeve panels  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.95
thisrecord1 = %records176400%
}

Else If InStr(trimmedString, "/176600")
{

info0 = 176600 ; Product ID
info1 = Bella Juniors Yoga Pant ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab77 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Comfortable elastic waistband`r`n- Slightly flared leg opening`r`n- Stylish longer length ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.06
thisrecord1 = %records176600%
}

Else If InStr(trimmedString, "/176800")
{

info0 = 176800 ; Product ID
info1 = Gildan Softstyle Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.88
thisrecord1 = %records176800%
}

Else If InStr(trimmedString, "/176900")
{

info0 = 176900 ; Product ID
info1 = Hanes Ladies V-Neck Nano-T ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 203700 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 208400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.3
thisrecord1 = %records176900%
}

Else If InStr(trimmedString, "/177000")
{

info0 = 177000 ; Product ID
info1 = Bella Juniors Tri-Blend Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records177000%
}

Else If InStr(trimmedString, "/177200")
{

info0 = 177200 ; Product ID
info1 = Ultra Club Tonal Stripe Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab64 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = wrinkle free with subtle tonal stripe  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.92
thisrecord1 = %records177200%
}

Else If InStr(trimmedString, "/177400")
{

info0 = 177400 ; Product ID
info1 = Port Authority Long Sleeve Easy Care Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 177600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.7
thisrecord1 = %records177400%
}

Else If InStr(trimmedString, "/177500")
{

info0 = 177500 ; Product ID
info1 = Port Authority Short Sleeve Easy Care Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.7
thisrecord1 = %records177500%
}

Else If InStr(trimmedString, "/177600")
{

info0 = 177600 ; Product ID
info1 = Port Authority Ladies Long Sleeve Easy Care Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 177400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.7
thisrecord1 = %records177600%
}

Else If InStr(trimmedString, "/177700")
{

info0 = 177700 ; Product ID
info1 = New Era Flat Bill Snapback Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab89 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.1
thisrecord1 = %records177700%
}

Else If InStr(trimmedString, "/177800")
{

info0 = 177800 ; Product ID
info1 = New Era Stretch Fit Cotton Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab90 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.16
thisrecord1 = %records177800%
}

Else If InStr(trimmedString, "/177900")
{

info0 = 177900 ; Product ID
info1 = New Era Stretch Fit Mesh Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab81 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.44
thisrecord1 = %records177900%
}

Else If InStr(trimmedString, "/178000")
{

info0 = 178000 ; Product ID
info1 = Valucap Bio-Washed Visor ; Product Title
info2 := cat7 ; Product Category
info3 := subcat33 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab79 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.9
thisrecord1 = %records178000%
}

Else If InStr(trimmedString, "/178100")
{

info0 = 178100 ; Product ID
info1 = Valucap Bio-Washed Camo Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab79 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.3
thisrecord1 = %records178100%
}

Else If InStr(trimmedString, "/178300")
{

info0 = 178300 ; Product ID
info1 = Yupoong Contrast Stitched Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab91 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.4
thisrecord1 = %records178300%
}

Else If InStr(trimmedString, "/178400")
{

info0 = 178400 ; Product ID
info1 = Bella Youth Girls Crewneck T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat67 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 123200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.75
thisrecord1 = %records178400%
}

Else If InStr(trimmedString, "/178600")
{

info0 = 178600 ; Product ID
info1 = Bella Youth Girls Tank ; Product Title
info2 := cat8 ; Product Category
info3 := subcat67 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 122500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.75
thisrecord1 = %records178600%
}

Else If InStr(trimmedString, "/178900")
{

info0 = 178900 ; Product ID
info1 = Bella Youth Girls Dance Pant ; Product Title
info2 := cat8 ; Product Category
info3 := subcat92 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab146 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Comfortable elastic waistband`r`n- Slightly flared leg opening`r`n- Stylish longer length ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11
thisrecord1 = %records178900%
}

Else If InStr(trimmedString, "/179000")
{

info0 = 179000 ; Product ID
info1 = Next Level Youth Girls Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat67 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 172500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.07
thisrecord1 = %records179000%
}

Else If InStr(trimmedString, "/179100")
{

info0 = 179100 ; Product ID
info1 = LAT Youth Girls Longer Length Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat67 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.05
thisrecord1 = %records179100%
}

Else If InStr(trimmedString, "/179700")
{

info0 = 179700 ; Product ID
info1 = Dyenomite Charity Ribbon Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185600 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.79
thisrecord1 = %records179700%
}

Else If InStr(trimmedString, "/179800")
{

info0 = 179800 ; Product ID
info1 = District Neon T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 179900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.29
thisrecord1 = %records179800%
}

Else If InStr(trimmedString, "/179900")
{

info0 = 179900 ; Product ID
info1 = District Juniors Neon T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 179800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.29
thisrecord1 = %records%
}

Else If InStr(trimmedString, "/180100")
{

info0 = 180100 ; Product ID
info1 = Next Level Juniors Tri-Blend Deep V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.88
thisrecord1 = %records180100%
}

Else If InStr(trimmedString, "/180200")
{

info0 = 180200 ; Product ID
info1 = Bayside Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 20.4
thisrecord1 = %records180200%
}

Else If InStr(trimmedString, "/180300")
{

info0 = 180300 ; Product ID
info1 = Bayside Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.1
thisrecord1 = %records180300%
}

Else If InStr(trimmedString, "/180400")
{

info0 = 180400 ; Product ID
info1 = Gildan Vintage Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab50 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.81
thisrecord1 = %records180400%
}

Else If InStr(trimmedString, "/180500")
{

info0 = 180500 ; Product ID
info1 = Independent Trading Lightweight Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.96
thisrecord1 = %records180500%
}

Else If InStr(trimmedString, "/180600")
{

info0 = 180600 ; Product ID
info1 = Independent Trading Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.95
thisrecord1 = %records180600%
}

Else If InStr(trimmedString, "/180700")
{

info0 = 180700 ; Product ID
info1 = Jerzees Open Bottom Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 202900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.03
thisrecord1 = %records180700%
}

Else If InStr(trimmedString, "/180800")
{

info0 = 180800 ; Product ID
info1 = Sport-Tek Performance Half-Zip Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 180900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.99
thisrecord1 = %records180800%
}

Else If InStr(trimmedString, "/180900")
{

info0 = 180900 ; Product ID
info1 = Sport-Tek Ladies Performance Half-Zip Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 180800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.99
thisrecord1 = %records180900%
}

Else If InStr(trimmedString, "/181000")
{

info0 = 181000 ; Product ID
info1 = 100`% Cotton Canvas Tote ; Product Title
info2 := cat11 ; Product Category
info3 := subcat42 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab101 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.66
thisrecord1 = %records181000%
}

Else If InStr(trimmedString, "/181100")
{

info0 = 181100 ; Product ID
info1 = Promotional Canvas Tote ; Product Title
info2 := cat11 ; Product Category
info3 := subcat42 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab104 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.8
thisrecord1 = %records181100%
}

Else If InStr(trimmedString, "/181200")
{

info0 = 181200 ; Product ID
info1 = Comfort Colors Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.2
thisrecord1 = %records181200%
}

Else If InStr(trimmedString, "/181300")
{

info0 = 181300 ; Product ID
info1 = Comfort Colors Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.5
thisrecord1 = %records181300%
}

Else If InStr(trimmedString, "/181500")
{

info0 = 181500 ; Product ID
info1 = Gildan Ladies Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 119700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.29
thisrecord1 = %records181500%
}

Else If InStr(trimmedString, "/181600")
{

info0 = 181600 ; Product ID
info1 = Gildan Ladies Open Bottom Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.27
thisrecord1 = %records181600%
}

Else If InStr(trimmedString, "/181700")
{

info0 = 181700 ; Product ID
info1 = J. America Ladies V-Neck Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 174200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.2
thisrecord1 = %records181700%
}

Else If InStr(trimmedString, "/182400")
{

info0 = 182400 ; Product ID
info1 = Hanes Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.65
thisrecord1 = %records182400%
}

Else If InStr(trimmedString, "/182500")
{

info0 = 182500 ; Product ID
info1 = Ultra Club Polo w/ Pocket ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab63 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.55
thisrecord1 = %records182500%
}

Else If InStr(trimmedString, "/182600")
{

info0 = 182600 ; Product ID
info1 = Ultra Club Lightweight Polo w/ Tipped Collar ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab57 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.29
thisrecord1 = %records182600%
}

Else If InStr(trimmedString, "/182700")
{

info0 = 182700 ; Product ID
info1 = 14 oz. Plastic Beverage Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab123 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records182700%
}

Else If InStr(trimmedString, "/182800")
{

info0 = 182800 ; Product ID
info1 = 22 oz. Plastic Beverage Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab123 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 50,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records182800%
}

Else If InStr(trimmedString, "/182900")
{

info0 = 182900 ; Product ID
info1 = Rabbit Skins Infant One-piece ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.99
thisrecord1 = %records182900%
}

Else If InStr(trimmedString, "/183000")
{

info0 = 183000 ; Product ID
info1 = Yupoong Solid Knit Beanie ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab80 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.79
thisrecord1 = %records183000%
}

Else If InStr(trimmedString, "/183100")
{

info0 = 183100 ; Product ID
info1 = Sportsman Bottom Stripe Knit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab80 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.9
thisrecord1 = %records183100%
}

Else If InStr(trimmedString, "/183200")
{

info0 = 183200 ; Product ID
info1 = District Spaced-Dyed Beanie ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab80 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.99
thisrecord1 = %records183200%
}

Else If InStr(trimmedString, "/183300")
{

info0 = 183300 ; Product ID
info1 = Champion Bottom Stripe Knit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab151 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records183300%
}

Else If InStr(trimmedString, "/183400")
{

info0 = 183400 ; Product ID
info1 = Sportsman Rugby Striped Knit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab80 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.9
thisrecord1 = %records183400%
}

Else If InStr(trimmedString, "/183500")
{

info0 = 183500 ; Product ID
info1 = Rabbit Skins Toddler Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.3
thisrecord1 = %records183500%
}

Else If InStr(trimmedString, "/183600")
{

info0 = 183600 ; Product ID
info1 = American Apparel Toddler Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 4.3
thisrecord1 = %records183600%
}

Else If InStr(trimmedString, "/183700")
{

info0 = 183700 ; Product ID
info1 = Waist Apron ; Product Title
info2 := cat10 ; Product Category
info3 := subcat41 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab47 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit5  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Can not receive personalized names ; Product Exceptions
info18 = 2.65
thisrecord1 = %records183700%
}

Else If InStr(trimmedString, "/183800")
{

info0 = 183800 ; Product ID
info1 = Medium Apron ; Product Title
info2 := cat10 ; Product Category
info3 := subcat41 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab47 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit5  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Can not receive personalized names  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.24
thisrecord1 = %records183800%
}

Else If InStr(trimmedString, "/183900")
{

info0 = 183900 ; Product ID
info1 = Large Apron ; Product Title
info2 := cat10 ; Product Category
info3 := subcat41 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab47 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit5  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Can not receive personalized names ; Product Exceptions
info18 = 4.85
thisrecord1 = %records183900%
}

Else If InStr(trimmedString, "/184000")
{

info0 = 184000 ; Product ID
info1 = Next Level Youth Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 172100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 2.49
thisrecord1 = %records184000%
}

Else If InStr(trimmedString, "/184100")
{

info0 = 184100 ; Product ID
info1 = Hanes Youth Long Sleeve Tagless T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 131100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 5.2
thisrecord1 = %records184100%
}

Else If InStr(trimmedString, "/184200")
{

info0 = 184200 ; Product ID
info1 = Anvil Youth Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 125000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 1.84
thisrecord1 = %records184200%
}

Else If InStr(trimmedString, "/184300")
{

info0 = 184300 ; Product ID
info1 = Canvas Youth Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 124200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.79
thisrecord1 = %records184300%
}

Else If InStr(trimmedString, "/184400")
{

info0 = 184400 ; Product ID
info1 = Canvas Youth Jersey V-Neck T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 161700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records184400%
}

Else If InStr(trimmedString, "/184500")
{

info0 = 184500 ; Product ID
info1 = American Apparel Youth Tri-Blend T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 169900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.89
thisrecord1 = %records184500%
}

Else If InStr(trimmedString, "/184600")
{

info0 = 184600 ; Product ID
info1 = Hanes Youth 50/50 Jersey Polo ; Product Title
info2 := cat8 ; Product Category
info3 := subcat79 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 176300 ; Product Youth Adult ID
info16 = EcoSmart fabric made with up to 5`% recycled plastic waterbottles  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.81
thisrecord1 = %records184600%
}

Else If InStr(trimmedString, "/184700")
{

info0 = 184700 ; Product ID
info1 = Augusta Youth Double Sleeve Stripe Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 166400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.31
thisrecord1 = %records184700%
}

Else If InStr(trimmedString, "/185100")
{

info0 = 185100 ; Product ID
info1 = Sport-Tek Youth Micro-Mesh Reversible Tank ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 173800 ; Product Youth Adult ID
info16 = Outside locker label ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records185100%
}

Else If InStr(trimmedString, "/185300")
{

info0 = 185300 ; Product ID
info1 = Sport-Tek Youth Micro-Mesh Reversible Sleeveless Jersey ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 174900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.99
thisrecord1 = %records185300%
}

Else If InStr(trimmedString, "/185500")
{

info0 = 185500 ; Product ID
info1 = Champion Youth Tagless T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 113300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.91
thisrecord1 = %records185500%
}

Else If InStr(trimmedString, "/185600")
{

info0 = 185600 ; Product ID
info1 = Dyenomite Youth Charity Ribbon Tie-Dye T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 179700 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, Tie dye pattern will vary on each shirt. Due to tie dye process, shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.79
thisrecord1 = %records185600%
}

Else If InStr(trimmedString, "/185700")
{

info0 = 185700 ; Product ID
info1 = Otto Caps Youth Foam/Mesh Baseball Hat ; Product Title
info2 := cat8 ; Product Category
info3 := subcat78 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab95 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.6
thisrecord1 = %records185700%
}

Else If InStr(trimmedString, "/185800")
{

info0 = 185800 ; Product ID
info1 = Yupoong Youth Twill Flexfit Hat ; Product Title
info2 := cat8 ; Product Category
info3 := subcat78 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab92 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 50000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.25
thisrecord1 = %records185800%
}

Else If InStr(trimmedString, "/185900")
{

info0 = 185900 ; Product ID
info1 = Yupoong Youth Athletic Mesh Flexfit Hat ; Product Title
info2 := cat8 ; Product Category
info3 := subcat78 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab94 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 100200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records185900%
}

Else If InStr(trimmedString, "/186000")
{

info0 = 186000 ; Product ID
info1 = Liberty Bags Small Duffel Bag ; Product Title
info2 := cat11 ; Product Category
info3 := subcat44 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab109 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.35
thisrecord1 = %records186000%
}

Else If InStr(trimmedString, "/186400")
{

info0 = 186400 ; Product ID
info1 = American Apparel Tri-Blend Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.64
thisrecord1 = %records186400%
}

Else If InStr(trimmedString, "/186500")
{

info0 = 186500 ; Product ID
info1 = American Apparel 50/50 Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records186500%
}

Else If InStr(trimmedString, "/186600")
{

info0 = 186600 ; Product ID
info1 = American Apparel Neon Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.79
thisrecord1 = %records186600%
}

Else If InStr(trimmedString, "/186700")
{

info0 = 186700 ; Product ID
info1 = American Apparel Tri-Blend Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.02
thisrecord1 = %records186700%
}

Else If InStr(trimmedString, "/186800")
{

info0 = 186800 ; Product ID
info1 = Next Level 60/40 V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab9 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 172700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = All colors have subtle heathered appearance except White and Black ; Product Exceptions
info18 = 4.03
thisrecord1 = %records186800%
}

Else If InStr(trimmedString, "/186900")
{

info0 = 186900 ; Product ID
info1 = Next Level Tri-Blend T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 187000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 190600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.72
thisrecord1 = %records186900%
}

Else If InStr(trimmedString, "/187000")
{

info0 = 187000 ; Product ID
info1 = Next Level Juniors Tri-Blend T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 186900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.03
thisrecord1 = %records187000%
}

Else If InStr(trimmedString, "/187200")
{

info0 = 187200 ; Product ID
info1 = American Apparel Juniors Tri-Blend T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 169900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 184500 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.79
thisrecord1 = %records187200%
}

Else If InStr(trimmedString, "/187400")
{

info0 = 187400 ; Product ID
info1 = LAT Ladies Longer Length Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.75
thisrecord1 = %records187400%
}

Else If InStr(trimmedString, "/187500")
{

info0 = 187500 ; Product ID
info1 = Next Level Juniors Jersey Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab146 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.74
thisrecord1 = %records187500%
}

Else If InStr(trimmedString, "/187600")
{

info0 = 187600 ; Product ID
info1 = Bella Juniors Flowy Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab148 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.31
thisrecord1 = %records187600%
}

Else If InStr(trimmedString, "/187800")
{

info0 = 187800 ; Product ID
info1 = Sport-Tek Mesh Reversible Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 187900 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Sport-Tek Mesh Shorts  ; Product Comment One
info18 = 5.99
info17 = empty ; Product Exceptions
info18 = 5.99
thisrecord1 = %records187800%
}

Else If InStr(trimmedString, "/187900")
{

info0 = 187900 ; Product ID
info1 = Sport-Tek Youth Mesh Reversible Tank ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 187800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.49
thisrecord1 = %records187900%
}

Else If InStr(trimmedString, "/188000")
{

info0 = 188000 ; Product ID
info1 = Sport-Tek Mesh Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 188100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Elastic waist with nylon drawstring (adult sizes only) ; Product Exceptions
info18 = 5.99
thisrecord1 = %records188000%
}

Else If InStr(trimmedString, "/188100")
{

info0 = 188100 ; Product ID
info1 = Sport-Tek Youth Mesh Shorts ; Product Title
info2 := cat8 ; Product Category
info3 := subcat82 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 175000 ; Product Youth Adult ID
info16 = adult sizes have drawcord ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records188100%
}

Else If InStr(trimmedString, "/188200")
{

info0 = 188200 ; Product ID
info1 = Hanes 50/50 Jersey Pocket Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.8
thisrecord1 = %records188200%
}

Else If InStr(trimmedString, "/188300")
{

info0 = 188300 ; Product ID
info1 = Fruit of the Loom 100`% Cotton Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather & Safety colors are a poly/cotton blend ; Product Exceptions
info18 = 3.97
thisrecord1 = %records188300%
}

Else If InStr(trimmedString, "/188400")
{

info0 = 188400 ; Product ID
info1 = Fruit of the Loom 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 203500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 2.78
thisrecord1 = %records188400%
}

Else If InStr(trimmedString, "/188600")
{

info0 = 188600 ; Product ID
info1 = Next Level Juniors Slub T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.63
thisrecord1 = %records188600%
}

Else If InStr(trimmedString, "/188700")
{

info0 = 188700 ; Product ID
info1 = Next Level Juniors Slub V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.83
thisrecord1 = %records188700%
}

Else If InStr(trimmedString, "/188900")
{

info0 = 188900 ; Product ID
info1 = Sport-Tek Ladies Competitor Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 204300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records188900%
}

Else If InStr(trimmedString, "/189000")
{

info0 = 189000 ; Product ID
info1 = Sport-Tek Ladies Ultimate V-Neck Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.49
thisrecord1 = %records189000%
}

Else If InStr(trimmedString, "/189100")
{

info0 = 189100 ; Product ID
info1 = Jerzees Spotshield 50/50 Jersey Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab54 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 189200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.42
thisrecord1 = %records189100%
}

Else If InStr(trimmedString, "/189200")
{

info0 = 189200 ; Product ID
info1 = Jerzees Ladies Spotshield 50/50 Jersey Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab54 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 189100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 190400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.69
thisrecord1 = %records89200%
}

Else If InStr(trimmedString, "/189300")
{

info0 = 189300 ; Product ID
info1 = CornerStone Performance Safety Shirt ; Product Title
info2 := cat10 ; Product Category
info3 := subcat39 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab45 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = ANSI / ISEA Class 2 certified ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records189300%
}

Else If InStr(trimmedString, "/189400")
{

info0 = 189400 ; Product ID
info1 = ML Kishigo Performance Safety Shirt ; Product Title
info2 := cat10 ; Product Category
info3 := subcat39 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab45 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = ANSI / ISEA Class 2 certified ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.75
thisrecord1 = %records189400%
}

Else If InStr(trimmedString, "/190000")
{

info0 = 190000 ; Product ID
info1 = Port Authority Basic Tablet Sleeve ; Product Title
info2 := cat13 ; Product Category
info3 := subcat59 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab127 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records190000%
}

Else If InStr(trimmedString, "/190100")
{

info0 = 190100 ; Product ID
info1 = ML Kishigo Safety Mesh Vest ; Product Title
info2 := cat10 ; Product Category
info3 := subcat39 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab46 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = ANSI / ISEA Class 2 certified ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.53
thisrecord1 = %records190100%
}

Else If InStr(trimmedString, "/190200")
{

info0 = 190200 ; Product ID
info1 = ML Kishigo Safety 6 Pocket Mesh Vest ; Product Title
info2 := cat10 ; Product Category
info3 := subcat39 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab46 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = ANSI / ISEA Class 2 certified ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.86
thisrecord1 = %records190200%
}

Else If InStr(trimmedString, "/190300")
{

info0 = 190300 ; Product ID
info1 = Next Level Juniors Neon Jersey Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab146 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.23
thisrecord1 = %records190300%
}

Else If InStr(trimmedString, "/190400")
{

info0 = 190400 ; Product ID
info1 = Jerzees Youth Spotshield 50/50 Jersey Polo ; Product Title
info2 := cat8 ; Product Category
info3 := subcat79 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab54 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 189200 ; Product Youth Adult ID
info16 = Spotshield fabric repels water and most oil based spills  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.81
thisrecord1 = %records190400%
}

Else If InStr(trimmedString, "/190600")
{

info0 = 190600 ; Product ID
info1 = Next Level Youth Tri-Blend T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 186900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.23
thisrecord1 = %records190600%
}

Else If InStr(trimmedString, "/190700")
{

info0 = 190700 ; Product ID
info1 = Bella Juniors Jersey V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 4.31
thisrecord1 = %records190700%
}

Else If InStr(trimmedString, "/190900")
{

info0 = 190900 ; Product ID
info1 = District Juniors Neon V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 179800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.49
thisrecord1 = %records190900%
}

Else If InStr(trimmedString, "/191000")
{

info0 = 191000 ; Product ID
info1 = New Balance Tempo Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 191100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records191000%
}

Else If InStr(trimmedString, "/191100")
{

info0 = 191100 ; Product ID
info1 = New Balance Ladies Tempo Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 191000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records191100%
}

Else If InStr(trimmedString, "/191200")
{

info0 = 191200 ; Product ID
info1 = New Balance Tempo Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 191300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.46
thisrecord1 = %records191200%
}

Else If InStr(trimmedString, "/191300")
{

info0 = 191300 ; Product ID
info1 = New Balance Ladies Tempo Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 191200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.46
thisrecord1 = %records191300%
}

Else If InStr(trimmedString, "/191700")
{

info0 = 191700 ; Product ID
info1 = Canada - Canvas Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 4.47
thisrecord1 = %records191700%
}

Else If InStr(trimmedString, "/191800")
{

info0 = 191800 ; Product ID
info1 = Canada - Canvas Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 197400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 4.78
thisrecord1 = %records191800%
}

Else If InStr(trimmedString, "/191900")
{

info0 = 191900 ; Product ID
info1 = Canada - Bella Juniors Favorite T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.47
thisrecord1 = %records191900%
}

Else If InStr(trimmedString, "/192000")
{

info0 = 192000 ; Product ID
info1 = Canada - Bella Juniors V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.93
thisrecord1 = %records192000%
}

Else If InStr(trimmedString, "/192300")
{

info0 = 192300 ; Product ID
info1 = Canada - Canvas Long Sleeve Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 6.65
thisrecord1 = %records192300%
}

Else If InStr(trimmedString, "/192400")
{

info0 = 192400 ; Product ID
info1 = Canada - Bella Juniors Raglan Crew ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.53
thisrecord1 = %records192400%
}

Else If InStr(trimmedString, "/192500")
{

info0 = 192500 ; Product ID
info1 = Canada - Bella Juniors Long Sleeve Crew ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 7.28
thisrecord1 = %records192500%
}

Else If InStr(trimmedString, "/192700")
{

info0 = 192700 ; Product ID
info1 = Canada - Bella Ladies V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.79
thisrecord1 = %records192700%
}

Else If InStr(trimmedString, "/192800")
{

info0 = 192800 ; Product ID
info1 = Canada - Gildan Softstyle Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 1.97
thisrecord1 = %records192800%
}

Else If InStr(trimmedString, "/192900")
{

info0 = 192900 ; Product ID
info1 = Spirit Rally Towel ; Product Title
info2 := cat15 ; Product Category
info3 := subcat77 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab144 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.25
thisrecord1 = %records192900%
}

Else If InStr(trimmedString, "/193000")
{

info0 = 193000 ; Product ID
info1 = Anvil Fringed Rally Towel ; Product Title
info2 := cat15 ; Product Category
info3 := subcat77 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab145 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = .95
thisrecord1 = %records193000%
}

Else If InStr(trimmedString, "/193100")
{

info0 = 193100 ; Product ID
info1 = Port Authority Ladies Stain Resistant Long Sleeve Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 193200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.99
thisrecord1 = %records193100%
}

Else If InStr(trimmedString, "/193200")
{

info0 = 193200 ; Product ID
info1 = Port Authority Stain Resistant Long Sleeve Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 193100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.99
thisrecord1 = %records193200%
}

Else If InStr(trimmedString, "/193300")
{

info0 = 193300 ; Product ID
info1 = 5.75 in. x 3.375 in. Oval Car Magnet ; Product Title
info2 := cat13 ; Product Category
info3 := subcat55 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab130 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records193300%
}

Else If InStr(trimmedString, "/193400")
{

info0 = 193400 ; Product ID
info1 = 5.5 in. Circle Car Magnet ; Product Title
info2 := cat13 ; Product Category
info3 := subcat55 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab130 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records193400%
}

Else If InStr(trimmedString, "/193500")
{

info0 = 193500 ; Product ID
info1 = 5.5 in. x 5.5 in. Paw Print Car Magnet ; Product Title
info2 := cat13 ; Product Category
info3 := subcat55 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab130 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records193500%
}

Else If InStr(trimmedString, "/193600")
{

info0 = 193600 ; Product ID
info1 = Gildan Ladies 100`% Cotton T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 04100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather, Safety colors, Blackberry, Lilac, and Sunset are poly/cotton blends ; Product Exceptions
info18 = 1.88
thisrecord1 = %records193600%
}

Else If InStr(trimmedString, "/193700")
{

info0 = 193700 ; Product ID
info1 = Gildan Ladies 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 225900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.76
thisrecord1 = %records193700%
}

Else If InStr(trimmedString, "/193800")
{

info0 = 193800 ; Product ID
info1 = Gildan Premium Blend Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.89
thisrecord1 = %records193800%
}

Else If InStr(trimmedString, "/193900")
{

info0 = 193900 ; Product ID
info1 = Gildan Premium Blend Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.12
thisrecord1 = %records193900%
}

Else If InStr(trimmedString, "/194000")
{

info0 = 194000 ; Product ID
info1 = Independent Trading Raglan Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.77
thisrecord1 = %records194000%
}

Else If InStr(trimmedString, "/194100")
{

info0 = 194100 ; Product ID
info1 = Gildan Vintage 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab50 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.5
thisrecord1 = %records194100%
}

Else If InStr(trimmedString, "/194300")
{

info0 = 194300 ; Product ID
info1 = Gildan Softstyle Long Sleeve Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.94
thisrecord1 = %records194300%
}

Else If InStr(trimmedString, "/194400")
{

info0 = 194400 ; Product ID
info1 = Dickies Stain Resistant Cook Shirt ; Product Title
info2 := cat10 ; Product Category
info3 := subcat41 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab43 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.75
thisrecord1 = %records194400%
}

Else If InStr(trimmedString, "/194500")
{

info0 = 194500 ; Product ID
info1 = New Balance Tempo Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 195000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records194500%
}

Else If InStr(trimmedString, "/194800")
{

info0 = 194800 ; Product ID
info1 = Boxercraft Juniors Flannel Pajama Pants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat64 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab76 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 198200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.48
thisrecord1 = %records194800%
}

Else If InStr(trimmedString, "/194900")
{

info0 = 194900 ; Product ID
info1 = Anvil Ladies Lightweight Scoop Neck Long Sleeve T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.52
thisrecord1 = %records194900%
}
Else If InStr(trimmedString, "/195000")
{

info0 = 195000 ; Product ID
info1 = New Balance Ladies Tempo Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 194500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records195000%
}

Else If InStr(trimmedString, "/195100")
{

info0 = 195100 ; Product ID
info1 = District Juniors Gravel 50/50 T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records195100%
}

Else If InStr(trimmedString, "/195200")
{

info0 = 195200 ; Product ID
info1 = Harriton Ladies Full-Zip Fleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 195400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records195200%
}

Else If InStr(trimmedString, "/195300")
{

info0 = 195300 ; Product ID
info1 = Port Authority Ladies 1/4-Zip Microfleece Pullover ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records195300%
}

Else If InStr(trimmedString, "/195400")
{

info0 = 195400 ; Product ID
info1 = Harriton Full-Zip Fleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 195200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records195400%
}

Else If InStr(trimmedString, "/195500")
{

info0 = 195500 ; Product ID
info1 = Harriton 1/4-Zip Fleece Pullover ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Bottom hem with drawcord and toggles ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records195500%
}

Else If InStr(trimmedString, "/195600")
{

info0 = 195600 ; Product ID
info1 = Port Authority Full-Zip Microfleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 195900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 216800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records195600%
}

Else If InStr(trimmedString, "/195700")
{

info0 = 195700 ; Product ID
info1 = Port Authority 1/4-Zip Microfleece Pullover ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records195700%
}

Else If InStr(trimmedString, "/195800")
{

info0 = 195800 ; Product ID
info1 = Harriton Fleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records195800%
}

Else If InStr(trimmedString, "/195900")
{

info0 = 195900 ; Product ID
info1 = Port Authority Ladies Full-Zip Microfleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab71 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 195900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 216800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records195900%
}

Else If InStr(trimmedString, "/196000")
{

info0 = 196000 ; Product ID
info1 = Dickies Classic Stain Resistant Chef Coat ; Product Title
info2 := cat10 ; Product Category
info3 := subcat41 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab43 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.45
thisrecord1 = %records196000%
}

Else If InStr(trimmedString, "/196100")
{

info0 = 196100 ; Product ID
info1 = 5.75 in. x 3.375 in. Oval Car Magnet w/ contrast trim ; Product Title
info2 := cat13 ; Product Category
info3 := subcat55 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab130 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records196100%
}

Else If InStr(trimmedString, "/196200")
{

info0 = 196200 ; Product ID
info1 = 5.5 in. Circle Car Magnet w/ contrast trim ; Product Title
info2 := cat13 ; Product Category
info3 := subcat55 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab130 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = free
thisrecord1 = %records196200%
}

Else If InStr(trimmedString, "/196300")
{

info0 = 196300 ; Product ID
info1 = Hanes Long Sleeve Nano-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 176900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 5.4
thisrecord1 = %records196300%
}

Else If InStr(trimmedString, "/196600")
{

info0 = 196600 ; Product ID
info1 = Sport-Tek 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.49
thisrecord1 = %records196600%
}

Else If InStr(trimmedString, "/196700")
{

info0 = 196700 ; Product ID
info1 = Hanes Tall Beefy-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 5.25
thisrecord1 = %records196700%
}

Else If InStr(trimmedString, "/196800")
{

info0 = 196800 ; Product ID
info1 = Sport-Tek Full-Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.49
thisrecord1 = %records196800%
}

Else If InStr(trimmedString, "/196900")
{

info0 = 196900 ; Product ID
info1 = Canada - Gildan Ladies 100`% Cotton T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 150200 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 167600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather, Safety colors, Blackberry, and Lilac are poly/cotton blends ; Product Exceptions
info18 = 2.18
thisrecord1 = %records196900%
}

Else If InStr(trimmedString, "/19700")
{

info0 = 19700 ; Product ID
info1 = Canada - Anvil Organic T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.91
thisrecord1 = %records19700%
}

Else If InStr(trimmedString, "/197000")
{

info0 = 197000 ; Product ID
info1 = Canada - Gildan Premium Blend Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8
thisrecord1 = %records197000%
}

Else If InStr(trimmedString, "/197100")
{

info0 = 197100 ; Product ID
info1 = Canada - Gildan Premium Blend Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.62
thisrecord1 = %records197100%
}

Else If InStr(trimmedString, "/197200")
{

info0 = 197200 ; Product ID
info1 = Canada - Gildan Ladies 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.82
thisrecord1 = %records197200%
}

Else If InStr(trimmedString, "/197300")
{

info0 = 197300 ; Product ID
info1 = Canada - Gildan Vintage 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab50 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records197300%
}

Else If InStr(trimmedString, "/197400")
{

info0 = 197400 ; Product ID
info1 = Canada - Bella Juniors Jersey V-neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 191800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 5.59
thisrecord1 = %records197400%
}

Else If InStr(trimmedString, "/197500")
{

info0 = 197500 ; Product ID
info1 = Rabbit Skins Infant Jersey One-piece ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 3.3
thisrecord1 = %records197500%
}

Else If InStr(trimmedString, "/197600")
{

info0 = 197600 ; Product ID
info1 = Rabbit Skins Infant Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.3
thisrecord1 = %records197600%
}

Else If InStr(trimmedString, "/197700")
{

info0 = 197700 ; Product ID
info1 = Jerzees 50/50 Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.18
thisrecord1 = %records197700%
}

Else If InStr(trimmedString, "/197800")
{

info0 = 197800 ; Product ID
info1 = Sport-Tek Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.49
thisrecord1 = %records197800%
}

Else If InStr(trimmedString, "/197900")
{

info0 = 197900 ; Product ID
info1 = Independent Trading Raglan Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 198700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.56
thisrecord1 = %records197900%
}

Else If InStr(trimmedString, "/198000")
{

info0 = 198000 ; Product ID
info1 = Next Level Tri-Blend Long Sleeve Hoodie ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.86
thisrecord1 = %records198000%
}

Else If InStr(trimmedString, "/198200")
{

info0 = 198200 ; Product ID
info1 = Boxercraft Flannel Pajama Pants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat64 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab76 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Button closure fly  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.1
thisrecord1 = %records198200%
}

Else If InStr(trimmedString, "/198600")
{

info0 = 198600 ; Product ID
info1 = Code 5 Camo Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Camo pattern will vary on each sweatshirt ; Product Exceptions
info18 = 17.72
thisrecord1 = %records198600%
}

Else If InStr(trimmedString, "/198700")
{

info0 = 198700 ; Product ID
info1 = Independent Trading Juniors Lightweight Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 197900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.89
thisrecord1 = %records198700%
}

Else If InStr(trimmedString, "/198800")
{

info0 = 198800 ; Product ID
info1 = Alternative Apparel Juniors Tri-Blend Wideneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab147 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.35
thisrecord1 = %records198800%
}

Else If InStr(trimmedString, "/199000")
{

info0 = 199000 ; Product ID
info1 = Alternative Apparel Tri-Blend Raglan Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab147 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 =  20
thisrecord1 = %records199000%
}

Else If InStr(trimmedString, "/199100")
{

info0 = 199100 ; Product ID
info1 = Bella Juniors Tri-Blend Wideneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab147 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records199100%
}

Else If InStr(trimmedString, "/199200")
{

info0 = 199200 ; Product ID
info1 = J. America Ladies Glitter Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.95
thisrecord1 = %records199200%
}

Else If InStr(trimmedString, "/199300")
{

info0 = 199300 ; Product ID
info1 = J. America Ladies Neon V-Neck Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.2
thisrecord1 = %records199300%
}

Else If InStr(trimmedString, "/199400")
{

info0 = 199400 ; Product ID
info1 = Canada - Bella Juniors Tri-Blend Wideneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab147 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.23
thisrecord1 = %records199400%
}

Else If InStr(trimmedString, "/199500")
{

info0 = 199500 ; Product ID
info1 = Next Level Youth Girls Long Sleeve Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat67 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records199500%
}

Else If InStr(trimmedString, "/199800")
{

info0 = 199800 ; Product ID
info1 = Canada - Anvil Sustainable T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.75
thisrecord1 = %records199800%
}

Else If InStr(trimmedString, "/199900")
{

info0 = 199900 ; Product ID
info1 = Canada - Anvil Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 2.89
thisrecord1 = %records199900%
}

Else If InStr(trimmedString, "/200000")
{

info0 = 200000 ; Product ID
info1 = Canada - Anvil Ladies Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.6
thisrecord1 = %records200000%
}

Else If InStr(trimmedString, "/200100")
{

info0 = 200100 ; Product ID
info1 = Canada - Anvil Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 4.3
thisrecord1 = %records200100%
}

Else If InStr(trimmedString, "/200800")
{

info0 = 200800 ; Product ID
info1 = Canada - Bella Juniors Flowy Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab148 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.06
thisrecord1 = %records200800%
}

Else If InStr(trimmedString, "/200900")
{

info0 = 200900 ; Product ID
info1 = Liberty Bags Large Duffel Bag ; Product Title
info2 := cat11 ; Product Category
info3 := subcat44 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab109 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.45
thisrecord1 = %records200900%
}

Else If InStr(trimmedString, "/201000")
{

info0 = 201000 ; Product ID
info1 = Neon - 3M Post-It Notes- 2.75" x 3" - 50 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab137 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records201000%
}

Else If InStr(trimmedString, "/201100")
{

info0 = 201100 ; Product ID
info1 = Neon - 3M Post-It Notes- 4" x 3" - 50 sheets/pad ; Product Title
info2 := cat13 ; Product Category
info3 := subcat57 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab137 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 500,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = printed sample only
thisrecord1 = %records201100%
}

Else If InStr(trimmedString, "/201200")
{

info0 = 201200 ; Product ID
info1 = Dyenomite Paw Print Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201300 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.65
thisrecord1 = %records201200%
}

Else If InStr(trimmedString, "/201300")
{

info0 = 201300 ; Product ID
info1 = Dyenomite Youth Paw Print Tie-Dye T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201200 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, Tie dye pattern will vary on each shirt. Due to tie dye process, shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.65
thisrecord1 = %records201300%
}

Else If InStr(trimmedString, "/201400")
{

info0 = 201400 ; Product ID
info1 = Dyenomite 100`% Cotton Two-Tone Spiral Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201500 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.1
thisrecord1 = %records201400%
}

Else If InStr(trimmedString, "/201500")
{

info0 = 201500 ; Product ID
info1 = GDyenomite Youth 100`% Cotton Two-Tone Spiral Tie-Dye T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201400 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, Tie dye pattern will vary on each shirt. Due to tie dye process, shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.1
thisrecord1 = %records201500%
}

Else If InStr(trimmedString, "/201600")
{

info0 = 201600 ; Product ID
info1 = Dyenomite 100`% Cotton Tonal Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201700 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.85
thisrecord1 = %records201600%
}

Else If InStr(trimmedString, "/201700")
{

info0 = 201700 ; Product ID
info1 = Dyenomite Youth 100`% Cotton Tonal Tie-Dye T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201600 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, Tie dye pattern will vary on each shirt. Due to tie dye process, shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.85
thisrecord1 = %records201700%
}

Else If InStr(trimmedString, "/201800")
{

info0 = 201800 ; Product ID
info1 = Dyenomite 100`% Cotton Rainbow Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201900 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.85
thisrecord1 = %records201800%
}

Else If InStr(trimmedString, "/201900")
{

info0 = 201900 ; Product ID
info1 = Dyenomite Youth 100`% Cotton Rainbow Tie-Dye T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 201800 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, Tie dye pattern will vary on each shirt. Due to tie dye process, shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.85
thisrecord1 = %records201900%
}

Else If InStr(trimmedString, "/202000")
{

info0 = 202000 ; Product ID
info1 = 16 oz. Reusable Plastic Party Cup ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab118 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records202000%
}

Else If InStr(trimmedString, "/202100")
{

info0 = 202100 ; Product ID
info1 = American Apparel Neon 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.03
thisrecord1 = %records202100%
}

Else If InStr(trimmedString, "/202300")
{

info0 = 202300 ; Product ID
info1 = Gildan Toddler 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 1.86
thisrecord1 = %records202300%
}

Else If InStr(trimmedString, "/202400")
{

info0 = 202400 ; Product ID
info1 = Hanes Nano Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.39
thisrecord1 = %records202400%
}

Else If InStr(trimmedString, "/202500")
{

info0 = 202500 ; Product ID
info1 = Hanes Nano Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.28
thisrecord1 = %records202500%
}

Else If InStr(trimmedString, "/202600")
{

info0 = 202600 ; Product ID
info1 = Hanes Nano Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.42
thisrecord1 = %records202600%
}

Else If InStr(trimmedString, "/202700")
{

info0 = 202700 ; Product ID
info1 = Jerzees Lightweight 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.07
thisrecord1 = %records202700%
}

Else If InStr(trimmedString, "/202800")
{

info0 = 202800 ; Product ID
info1 = Jerzees Youth Lightweight 1/4 Zip Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat81 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 130900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.84
thisrecord1 = %records202800%
}

Else If InStr(trimmedString, "/202900")
{

info0 = 202900 ; Product ID
info1 = Jerzees Youth Open Bottom Sweatpants ; Product Title
info2 := cat8 ; Product Category
info3 := subcat92 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 180700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.38
thisrecord1 = %records202900%
}

Else If InStr(trimmedString, "/203000")
{

info0 = 203000 ; Product ID
info1 = Jerzees 50/50 Tall Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.72
thisrecord1 = %records203000%
}

Else If InStr(trimmedString, "/203100")
{

info0 = 203100 ; Product ID
info1 = Jerzees Ladies 50/50 T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 138800 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 158600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.21
thisrecord1 = %records203100%
}

Else If InStr(trimmedString, "/203200")
{

info0 = 203200 ; Product ID
info1 = 17 oz. Stemless Glass ; Product Title
info2 := cat6 ; Product Category
info3 := subcat27 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab121 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records203200%
}

Else If InStr(trimmedString, "/203300")
{

info0 = 203300 ; Product ID
info1 = 16 oz. Steel City Insulated Travel Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat30 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab115 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records203300%
}

Else If InStr(trimmedString, "/203400")
{

info0 = 203400 ; Product ID
info1 = 16 oz. Plastic Java Travel Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat30 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab117 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records203400%
}

Else If InStr(trimmedString, "/203500")
{

info0 = 203500 ; Product ID
info1 = Fruit of the Loom Ladies 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 188400 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 3.15
thisrecord1 = %records203500%
}

Else If InStr(trimmedString, "/203600")
{

info0 = 203600 ; Product ID
info1 = Champion Youth Baseball Raglan ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab33 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 99000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Oxford is a poly/cotton blend ; Product Exceptions
info18 = 5
thisrecord1 = %records203600%
}

Else If InStr(trimmedString, "/203700")
{

info0 = 203700 ; Product ID
info1 = Hanes V-Neck Nano-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 176900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.85
thisrecord1 = %records203700%
}

Else If InStr(trimmedString, "/203800")
{

info0 = 203800 ; Product ID
info1 = Hanes Pocket Nano-T ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.5
thisrecord1 = %records203800%
}

Else If InStr(trimmedString, "/203900")
{

info0 = 203900 ; Product ID
info1 = Hanes Tagless Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 3.69
thisrecord1 = %records203900%
}

Else If InStr(trimmedString, "/204100")
{

info0 = 204100 ; Product ID
info1 = 20 oz. Mason Jar-Style Acrylic Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat28 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab125 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 2
thisrecord1 = %records204100%
}

Else If InStr(trimmedString, "/204200")
{

info0 = 204200 ; Product ID
info1 = Augusta Juniors Colorblock Mesh Volleyball Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Longer length  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.3
thisrecord1 = %records204200%
}

Else If InStr(trimmedString, "/204300")
{

info0 = 204300 ; Product ID
info1 = Sport-Tek Competitor Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 188900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records204300%
}

Else If InStr(trimmedString, "/204400")
{

info0 = 204400 ; Product ID
info1 = Sport-Tek Ladies Competitor V-Neck Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records204400%
}

Else If InStr(trimmedString, "/204500")
{

info0 = 204500 ; Product ID
info1 = Hanes Cool Dri Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 229600 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.31
thisrecord1 = %records204500%
}

Else If InStr(trimmedString, "/204600")
{

info0 = 204600 ; Product ID
info1 = Hanes Ladies Cool Dri V-Neck Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.91
thisrecord1 = %records204600%
}

Else If InStr(trimmedString, "/204700")
{

info0 = 204700 ; Product ID
info1 = Augusta Ladies V-Neck Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 167800 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 207100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.8
thisrecord1 = %records204700%
}

Else If InStr(trimmedString, "/204900")
{

info0 = 204900 ; Product ID
info1 = Fruit of the Loom 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 209300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather & neon colors are a poly/cotton blend ; Product Exceptions
info18 = 1.46
thisrecord1 = %records204900%
}

Else If InStr(trimmedString, "/205000")
{

info0 = 205000 ; Product ID
info1 = Sport-Tek Competitor Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 205100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records205000%
}

Else If InStr(trimmedString, "/205100")
{

info0 = 205100 ; Product ID
info1 = Sport-Tek Ladies Competitor Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 205000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records205100%
}

Else If InStr(trimmedString, "/205200")
{

info0 = 205200 ; Product ID
info1 = All Sport Performance Baseball Raglan ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records205200%
}

Else If InStr(trimmedString, "/205400")
{

info0 = 205400 ; Product ID
info1 = Port Authority Silk Touch Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 205500 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 207000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records205400%
}

Else If InStr(trimmedString, "/205500")
{

info0 = 205500 ; Product ID
info1 = Port Authority Ladies Silk Touch Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 205400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records205500%
}

Else If InStr(trimmedString, "/205600")
{

info0 = 205600 ; Product ID
info1 = All Sport Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab61 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 207200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records205600%
}

Else If InStr(trimmedString, "/205700")
{

info0 = 205700 ; Product ID
info1 = Sport-Tek Contrast Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = All colors are heather performance with contrast color blocking  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records205700%
}

Else If InStr(trimmedString, "/205800")
{

info0 = 205800 ; Product ID
info1 = Ultra Club Cool & Dry Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab64 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.57
thisrecord1 = %records205800%
}

Else If InStr(trimmedString, "/205900")
{

info0 = 205900 ; Product ID
info1 = Ultra Club Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab36 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.56
thisrecord1 = %records205900%
}

Else If InStr(trimmedString, "/206000")
{

info0 = 206000 ; Product ID
info1 = Sport-Tek Full-Zip Colorblock Warm-Up Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 207300 ; Product Youth Adult ID
info16 = Jersey lining with mesh insets  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records206000%
}

Else If InStr(trimmedString, "/206100")
{

info0 = 206100 ; Product ID
info1 = Sport-Tek Warm-Up Pant ; Product Title
info2 := cat3 ; Product Category
info3 := subcat62 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 207400 ; Product Youth Adult ID
info16 = Extended leg zippers  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records206100%
}

Else If InStr(trimmedString, "/206300")
{

info0 = 206300 ; Product ID
info1 = Augusta Colorblock Tricot Warm-Up Pant ; Product Title
info2 := cat3 ; Product Category
info3 := subcat62 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab22 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Zippers down bottom side leg  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.5
thisrecord1 = %records206300%
}

Else If InStr(trimmedString, "/206500")
{

info0 = 206500 ; Product ID
info1 = Sport-Tek Tricot Warm-Up Pant ; Product Title
info2 := cat3 ; Product Category
info3 := subcat62 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab22 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records206500%
}

Else If InStr(trimmedString, "/206600")
{

info0 = 206600 ; Product ID
info1 = Fruit of the Loom Youth 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 204900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather & neon colors are a poly/cotton blend ; Product Exceptions
info18 = 1.51
thisrecord1 = %records206600%
}

Else If InStr(trimmedString, "/206700")
{

info0 = 206700 ; Product ID
info1 = Sport-Tek Youth Competitor Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 204300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.49
thisrecord1 = %records206700%
}

Else If InStr(trimmedString, "/206800")
{

info0 = 206800 ; Product ID
info1 = Hanes Youth Cool Dri Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 229600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.7
thisrecord1 = %records206800%
}

Else If InStr(trimmedString, "/206900")
{

info0 = 206900 ; Product ID
info1 = All Sport Youth Performance Baseball Raglan ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab4 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 205200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.99
thisrecord1 = %records206900%
}

Else If InStr(trimmedString, "/207000")
{

info0 = 207000 ; Product ID
info1 = Port Authority Youth Silk Touch Performance Polo ; Product Title
info2 := cat8 ; Product Category
info3 := subcat79 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 205400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.99
thisrecord1 = %records207000%
}

Else If InStr(trimmedString, "/207100")
{
info0 = 207100 ; Product ID
info1 = Augusta Youth Girls V-Neck Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 204700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.95
thisrecord1 = %records207100%
}

Else If InStr(trimmedString, "/207200")
{
info0 = 207200 ; Product ID
info1 = All Sport Youth Performance Tank ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab39 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 205600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records207200%
}

Else If InStr(trimmedString, "/207300")
{
info0 = 207300 ; Product ID
info1 = Sport-Tek Youth Full-Zip Colorblock Warm-Up Jacket ; Product Title
info2 := cat8 ; Product Category
info3 := subcat88 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records207300%
}

Else If InStr(trimmedString, "/207400")
{
info0 = 207400 ; Product ID
info1 = Sport-Tek Youth Warm-Up Pant ; Product Title
info2 := cat8 ; Product Category
info3 := subcat84 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206100 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records207400%
}

Else If InStr(trimmedString, "/207500")
{
info0 = 207500 ; Product ID
info1 = Bella Ladies Tri-Blend V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 208100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.6
thisrecord1 = %records207500%
}

Else If InStr(trimmedString, "/207600")
{
info0 = 207600 ; Product ID
info1 = Rabbit Skins Infant Vintage One-piece ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.45
thisrecord1 = %records207600%
}

Else If InStr(trimmedString, "/207700")
{
info0 = 207700 ; Product ID
info1 = Rabbit Skins Toddler Vintage T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.6
thisrecord1 = %records207700%
}

Else If InStr(trimmedString, "/207800")
{
info0 = 207800 ; Product ID
info1 = Augusta Performance Pocket Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.8
thisrecord1 = %records207800%
}

Else If InStr(trimmedString, "/207900")
{
info0 = 207900 ; Product ID
info1 = Comfort Colors 100`% Cotton Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.77
thisrecord1 = %records207900%
}

Else If InStr(trimmedString, "/208000")
{
info0 = 208000 ; Product ID
info1 = Comfort Colors 100`% Cotton Long Sleeve Shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.03
thisrecord1 = %records208000%
}

Else If InStr(trimmedString, "/208200")
{
info0 = 208200 ; Product ID
info1 = District Made Ladies Camo T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records208200%
}

Else If InStr(trimmedString, "/208300")
{
info0 = 208300 ; Product ID
info1 = Sport-Tek Ladies Replica Football Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Yoke and sleeves - 100`% polyester dazzle fabric ; Product Comment One
info17 = Not meant to be worn with pads ; Product Exceptions
info18 = 6.43
thisrecord1 = %records208300%
}

Else If InStr(trimmedString, "/208400")
{
info0 = 208400 ; Product ID
info1 = Hanes Youth Nano-T ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 176000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.03
thisrecord1 = %records208400%
}

Else If InStr(trimmedString, "/208500")
{
info0 = 208500 ; Product ID
info1 = Hanes Nano 1/4 Zip Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.98
thisrecord1 = %records208500%
}

Else If InStr(trimmedString, "/208600")
{
info0 = 208600 ; Product ID
info1 = Augusta Colorblock Performance Soccer Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 210800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.75
thisrecord1 = %records208600%
}

Else If InStr(trimmedString, "/208700")
{
info0 = 208700 ; Product ID
info1 = Glass Tree Ornament ; Product Title
info2 := cat15 ; Product Category
info3 := subcat75 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab141 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records208700%
}

Else If InStr(trimmedString, "/208800")
{
info0 = 208800 ; Product ID
info1 = Dickies V-Neck Scrub Top ; Product Title
info2 := cat10 ; Product Category
info3 := subcat40 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab48 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7
thisrecord1 = %records208800%
}

Else If InStr(trimmedString, "/208900")
{
info0 = 208900 ; Product ID
info1 = Dickies Drawstring Scrub Pant ; Product Title
info2 := cat10 ; Product Category
info3 := subcat40 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab48 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.53
thisrecord1 = %records208900%
}

Else If InStr(trimmedString, "/209000")
{
info0 = 209000 ; Product ID
info1 = District Juniors Camo Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.21
thisrecord1 = %records209000%
}

Else If InStr(trimmedString, "/209100")
{
info0 = 209100 ; Product ID
info1 = Next Level Ladies Tri-Blend Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.61
thisrecord1 = %records209100%
}

Else If InStr(trimmedString, "/209200")
{
info0 = 209200 ; Product ID
info1 = Bella Juniors Flowy Boxy Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab148 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records209200%
}

Else If InStr(trimmedString, "/209300")
{
info0 = 209300 ; Product ID
info1 = Fruit of the Loom Ladies 100`% Cotton T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 204900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 2.49
thisrecord1 = %records209300%
}

Else If InStr(trimmedString, "/209400")
{
info0 = 209400 ; Product ID
info1 = J. America Cloud Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.6
thisrecord1 = %records209400%
}

Else If InStr(trimmedString, "/209500")
{
info0 = 209500 ; Product ID
info1 = Port and Company Tie-Dye Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 210900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Hand dyed, pattern will vary on each product ; Product Exceptions
info18 = 9.57
thisrecord1 = %records209500%
}

Else If InStr(trimmedString, "/209600")
{
info0 = 209600 ; Product ID
info1 = Port Authority Pocket Cinchpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab108 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.99
thisrecord1 = %records209600%
}

Else If InStr(trimmedString, "/209700")
{
info0 = 209700 ; Product ID
info1 = District Made Tri-Blend Henley ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records209700%
}

Else If InStr(trimmedString, "/209800")
{
info0 = 209800 ; Product ID
info1 = Canvas Tri-Blend Henley ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.25
thisrecord1 = %records209800%
}

Else If InStr(trimmedString, "/209900")
{
info0 = 209900 ; Product ID
info1 = Anvil Long Sleeve Hoodie ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 7.81
thisrecord1 = %records209900%
}

Else If InStr(trimmedString, "/210000")
{
info0 = 210000 ; Product ID
info1 = District 50/50 Long Sleeve Henley ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.35
thisrecord1 = %records210000%
}

Else If InStr(trimmedString, "/210100")
{
info0 = 210100 ; Product ID
info1 = District Raglan Long Sleeve Hoodie ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.19
thisrecord1 = %records210100%
}

Else If InStr(trimmedString, "/210200")
{
info0 = 210200 ; Product ID
info1 = District Lightweight Zip Long Sleeve Hoodie ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records210200%
}

Else If InStr(trimmedString, "/210300")
{
info0 = 210300 ; Product ID
info1 = Canvas 60/40 Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Dark Grey Heather is 52/48 blend ; Product Exceptions
info18 = 13.99
thisrecord1 = %records210300%
}

Else If InStr(trimmedString, "/210600")
{
info0 = 210600 ; Product ID
info1 = Anvil Ladies French Terry Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.99
thisrecord1 = %records210600%
}

Else If InStr(trimmedString, "/210700")
{
info0 = 210700 ; Product ID
info1 = Augusta Striker Performance Soccer Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 211000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records210700%
}

Else If InStr(trimmedString, "/210800")
{
info0 = 210800 ; Product ID
info1 = Augusta Youth Colorblock Performance Soccer Jersey ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab4 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 208600 ; Product Youth Adult ID
info16 = Contrast color side panels, raglan piping, and v-neck collar  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.3
thisrecord1 = %records210800%
}

Else If InStr(trimmedString, "/210900")
{
info0 = 210900 ; Product ID
info1 = Port and Company Youth Tie-Dye Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 209500 ; Product Youth Adult ID
info16 = Hand dyed ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.59
thisrecord1 = %records210900%
}

Else If InStr(trimmedString, "/211000")
{
info0 = 211000 ; Product ID
info1 = Augusta Youth Striker Performance Soccer Jersey ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab4 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 210700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.95
thisrecord1 = %records211000%
}

Else If InStr(trimmedString, "/211000")
{
info0 = 211000 ; Product ID
info1 = Augusta Youth Striker Performance Soccer Jersey ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab4 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 210700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.95
thisrecord1 = %records211000%
}

Else If InStr(trimmedString, "/211200")
{
info0 = 211200 ; Product ID
info1 = District Concert T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 211300 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 242800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 1.94
thisrecord1 = %records211200%
}

Else If InStr(trimmedString, "/211300")
{
info0 = 211300 ; Product ID
info1 = District Juniors Concert T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 211200 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 242800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 1.94
thisrecord1 = %records211300%
}

Else If InStr(trimmedString, "/211400")
{
info0 = 211400 ; Product ID
info1 = District Juniors Vintage Wash V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a cotton/viscose blend ; Product Exceptions
info18 = 3.25
thisrecord1 = %records211400%
}

Else If InStr(trimmedString, "/211500")
{
info0 = 211500 ; Product ID
info1 = Next Level Juniors Tri-Blend Dolman T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.95
thisrecord1 = %records211500%
}

Else If InStr(trimmedString, "/211600")
{
info0 = 211600 ; Product ID
info1 = Champion 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.43
thisrecord1 = %records211600%
}

Else If InStr(trimmedString, "/211700")
{
info0 = 211700 ; Product ID
info1 = Champion 50/50 Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.38
thisrecord1 = %records211700%
}

Else If InStr(trimmedString, "/211800")
{
info0 = 211800 ; Product ID
info1 = Dickies Lightweight Industrial Work Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab97 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10
thisrecord1 = %records211800%
}

Else If InStr(trimmedString, "/211900")
{
info0 = 211900 ; Product ID
info1 = Dickies Twill Industrial Work Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.29
thisrecord1 = %records211900%
}

Else If InStr(trimmedString, "/212000")
{
info0 = 212000 ; Product ID
info1 = CornerStone Long Sleeve Performance Safety Shirt ; Product Title
info2 := cat10 ; Product Category
info3 := subcat39 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab45 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = ANSI / ISEA Class 2 certified ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records212000%
}

Else If InStr(trimmedString, "/212100")
{
info0 = 212100 ; Product ID
info1 = CornerStone Heavyweight Lined Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records212100%
}

Else If InStr(trimmedString, "/212200")
{
info0 = 212200 ; Product ID
info1 = District Juniors Varsity V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.99
thisrecord1 = %records212200%
}

Else If InStr(trimmedString, "/212300")
{
info0 = 212300 ; Product ID
info1 = District Neon Flat Bill Snapback Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab83 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.49
thisrecord1 = %records212300%
}

Else If InStr(trimmedString, "/212400")
{
info0 = 212400 ; Product ID
info1 = District Camo Flat Bill Snapback Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab83 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.49
thisrecord1 = %records212400%
}

Else If InStr(trimmedString, "/212600")
{
info0 = 212600 ; Product ID
info1 = Canvas Neon Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.8
thisrecord1 = %records212600%
}

Else If InStr(trimmedString, "/212700")
{
info0 = 212700 ; Product ID
info1 = Authentic Pigment Ladies Flowy Pocket Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.5
thisrecord1 = %records212700%
}

Else If InStr(trimmedString, "/212800")
{
info0 = 212800 ; Product ID
info1 = Canada - Anvil Long Sleeve Hoodie ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 8.95
thisrecord1 = %records212800%
}

Else If InStr(trimmedString, "/212900")
{
info0 = 212900 ; Product ID
info1 = Canada - Fruit of the Loom 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 213000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 1.82
thisrecord1 = %records212900%
}

Else If InStr(trimmedString, "/213000")
{
info0 = 213000 ; Product ID
info1 = Canada - Fruit of the Loom Youth 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 212900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 1.76
thisrecord1 = %records213000%
}

Else If InStr(trimmedString, "/213100")
{
info0 = 213100 ; Product ID
info1 = Canada - Gildan Toddler 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 1.87
thisrecord1 = %records213100%
}

Else If InStr(trimmedString, "/213200")
{
info0 = 213200 ; Product ID
info1 = Canada - Fruit of the Loom 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 3.07
thisrecord1 = %records213200%
}

Else If InStr(trimmedString, "/213300")
{
info0 = 213300 ; Product ID
info1 = Canada - Fruit of the Loom Ladies 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 213500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.41
thisrecord1 = %records213300%
}

Else If InStr(trimmedString, "/213400")
{
info0 = 213400 ; Product ID
info1 = Port Authority Silk Touch Interlock Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 213500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records213400%
}

Else If InStr(trimmedString, "/213500")
{
info0 = 213500 ; Product ID
info1 = Port Authority Ladies Silk Touch Interlock Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 213400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records213500%
}

Else If InStr(trimmedString, "/213600")
{
info0 = 213600 ; Product ID
info1 = A4 Promotional Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 240900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.37
thisrecord1 = %records213600%
}

Else If InStr(trimmedString, "/213700")
{
info0 = 213700 ; Product ID
info1 = Sport-Tek Competitor Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 213800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records213700%
}

Else If InStr(trimmedString, "/213800")
{
info0 = 213800 ; Product ID
info1 = Sport-Tek Youth Competitor Long Sleeve Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab0 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 213700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.49
thisrecord1 = %records213800%
}

Else If InStr(trimmedString, "/213900")
{
info0 = 213900 ; Product ID
info1 = Sport-Tek Ladies Long Sleeve V-Neck Competitor Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records213900%
}

Else If InStr(trimmedString, "/214000")
{
info0 = 214000 ; Product ID
info1 = Port Authority Silk Touch Performance Pocket Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.99
thisrecord1 = %records214000%
}

Else If InStr(trimmedString, "/214100")
{
info0 = 214100 ; Product ID
info1 = Badger Digital Camo Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab38 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Personalized names and numbers not available for this item  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.33
thisrecord1 = %records214100%
}

Else If InStr(trimmedString, "/214200")
{
info0 = 214200 ; Product ID
info1 = Comfort Colors 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.23
thisrecord1 = %records214200%
}

Else If InStr(trimmedString, "/214300")
{
info0 = 214300 ; Product ID
info1 = Badger Digital Camo Contrast Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Sublimated digital camo side and sleeve panels  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.75
thisrecord1 = %records214300%
}

Else If InStr(trimmedString, "/214400")
{
info0 = 214400 ; Product ID
info1 = Contrast Foldable Can KOOZIE ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab114 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records214400%
}

Else If InStr(trimmedString, "/214500")
{
info0 = 214500 ; Product ID
info1 = Team 365 Colorblock Performance Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 214600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Sport silver mesh and white side panels  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records214500%
}

Else If InStr(trimmedString, "/214600")
{
info0 = 214600 ; Product ID
info1 = Team 365 Ladies Colorblock Performance Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 214500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Sport silver mesh and white side panels  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records214600%
}

Else If InStr(trimmedString, "/214700")
{
info0 = 214700 ; Product ID
info1 = Team 365 Colorblock Performance Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records214700%
}

Else If InStr(trimmedString, "/214900")
{
info0 = 214900 ; Product ID
info1 = Team 365 Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab72 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 215000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records214900%
}

Else If InStr(trimmedString, "/215000")
{
info0 = 215000 ; Product ID
info1 = Team 365 Ladies Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab72 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 214900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records215000%
}

Else If InStr(trimmedString, "/215100")
{
info0 = 215100 ; Product ID
info1 = Team 365 Colorblock Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 215200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records215100%
}

Else If InStr(trimmedString, "/215200")
{
info0 = 215200 ; Product ID
info1 = Team 365 Ladies Colorblock Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 215100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records215200%
}

Else If InStr(trimmedString, "/215300")
{
info0 = 215300 ; Product ID
info1 = Team 365 Mesh Contrast Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 215400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records215300%
}

Else If InStr(trimmedString, "/215400")
{
info0 = 215400 ; Product ID
info1 = Team 365 Ladies Mesh Contrast Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 215300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records215400%
}

Else If InStr(trimmedString, "/215600")
{
info0 = 215600 ; Product ID
info1 = Team 365 Ladies Pink Swirl Performance Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records215600%
}

Else If InStr(trimmedString, "/215700")
{
info0 = 215700 ; Product ID
info1 = Team 365 Contrast Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 215900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 215800 ; Product Youth Adult ID
info16 = White large hole mesh lined hood ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records215700%
}

Else If InStr(trimmedString, "/215800")
{
info0 = 215800 ; Product ID
info1 = Team 365 Youth Contrast Performance Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat83 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab4 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 215700 ; Product Youth Adult ID
info16 = Contrast white inserts at front shoulders, Zippered size pockets  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records215800%
}

Else If InStr(trimmedString, "/215900")
{
info0 = 215900 ; Product ID
info1 = Team 365 Ladies Contrast Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 215700 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 215800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records215900%
}

Else If InStr(trimmedString, "/216000")
{
info0 = 216000 ; Product ID
info1 = Team 365 Varsity Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab23 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records216000%
}

Else If InStr(trimmedString, "/216100")
{
info0 = 216100 ; Product ID
info1 = Team 365 Waterproof Hooded Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat52 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = There is reflective tape at right chest and front pockets ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 29.99
thisrecord1 = %records216100%
}

Else If InStr(trimmedString, "/216200")
{
info0 = 216200 ; Product ID
info1 = Team 365 Performance Warm-Up Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 216400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records216200%
}

Else If InStr(trimmedString, "/216300")
{
info0 = 216300 ; Product ID
info1 = Team 365 Performance Warm-Up Pant ; Product Title
info2 := cat3 ; Product Category
info3 := subcat62 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 216500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Zippers down bottom side leg  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records216300%
}

Else If InStr(trimmedString, "/216400")
{
info0 = 216400 ; Product ID
info1 = Team 365 Ladies Performance Warm-Up Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 216200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records216400%
}

Else If InStr(trimmedString, "/216500")
{
info0 = 216500 ; Product ID
info1 = Team 365 Ladies Performance Warm-Up Pant ; Product Title
info2 := cat3 ; Product Category
info3 := subcat62 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 216300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Zippers down bottom side leg  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records216500%
}

Else If InStr(trimmedString, "/216600")
{
info0 = 216600 ; Product ID
info1 = Team 365 Headsweats Performance Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab86 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Machine washable & air dry ; Product Exceptions
info18 = 9.99
thisrecord1 = %records216600%
}

Else If InStr(trimmedString, "/216700")
{
info0 = 216700 ; Product ID
info1 = Team 365 Full-Zip Microfleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 216900 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 216800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info18 = 12.99
info17 = empty ; Product Exceptions
info18 = 12.99

thisrecord1 = %records216700%
}

Else If InStr(trimmedString, "/216800")
{
info0 = 216800 ; Product ID
info1 = Team 365 Youth Full-Zip Microfleece Jacket ; Product Title
info2 := cat8 ; Product Category
info3 := subcat89 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 195600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records216800%
}

Else If InStr(trimmedString, "/216900")
{
info0 = 216900 ; Product ID
info1 = Team 365 Ladies Full-Zip Microfleece Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat49 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 216700 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 216800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records16900%
}

Else If InStr(trimmedString, "/217100")
{
info0 = 217100 ; Product ID
info1 = Yupoong Flat Bill Snapback Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab85 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Throwback contrast green under visor  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.95
thisrecord1 = %records217100%
}

Else If InStr(trimmedString, "/217200")
{
info0 = 217200 ; Product ID
info1 = Port Authority Mesh Cinchpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab106 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.99
thisrecord1 = %records217200%
}

Else If InStr(trimmedString, "/217300")
{
info0 = 217300 ; Product ID
info1 = Tie-Dye Cinchpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab110 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.5
thisrecord1 = %records217300%
}

Else If InStr(trimmedString, "/217400")
{
info0 = 217400 ; Product ID
info1 = Badger Ladies Performance Racerback Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.8
thisrecord1 = %records217400%
}

Else If InStr(trimmedString, "/217500")
{
info0 = 217500 ; Product ID
info1 = Bella Juniors Tri-Blend T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 242000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.79
thisrecord1 = %records217500%
}

Else If InStr(trimmedString, "/217600")
{
info0 = 217600 ; Product ID
info1 = Dyenomite Juniors Heart Tie-Dye T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.15
thisrecord1 = %records217600%
}

Else If InStr(trimmedString, "/217700")
{
info0 = 217700 ; Product ID
info1 = Featherlite Stain Resistant Twill Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.25
thisrecord1 = %records217700%
}

Else If InStr(trimmedString, "/217800")
{
info0 = 217800 ; Product ID
info1 = Devon & Jones Banker Stripe Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 217900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = Devon & Jones Banker Stripe Dress Shirt
thisrecord1 = %records217800%
}

Else If InStr(trimmedString, "/217900")
{
info0 = 217900 ; Product ID
info1 = Devon & Jones Ladies Banker Stripe Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 217800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records217900%
}

Else If InStr(trimmedString, "/218000")
{
info0 = 218000 ; Product ID
info1 = Devon & Jones Gingham Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 218100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records218000%
}

Else If InStr(trimmedString, "/218100")
{
info0 = 218100 ; Product ID
info1 = Devon & Jones Ladies Gingham Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 218000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records218100%
}

Else If InStr(trimmedString, "/218200")
{
info0 = 218200 ; Product ID
info1 = Devon & Jones Solid Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 218300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records218200%
}

Else If InStr(trimmedString, "/218300")
{
info0 = 218300 ; Product ID
info1 = Devon & Jones Ladies Solid Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 218200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records218300%
}

Else If InStr(trimmedString, "/218400")
{
info0 = 218400 ; Product ID
info1 = Devon & Jones Tattersall Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records218400%
}

Else If InStr(trimmedString, "/218500")
{
info0 = 218500 ; Product ID
info1 = Core 365 Fleece Lined Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab72 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 218600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records218500%
}

Else If InStr(trimmedString, "/218600")
{
info0 = 218600 ; Product ID
info1 = Core 365 Ladies Fleece Lined Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab72 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 218500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records218600%
}

Else If InStr(trimmedString, "/218700")
{
info0 = 218700 ; Product ID
info1 = Core 365 Lightweight Full-Zip Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 218800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records218700%
}

Else If InStr(trimmedString, "/218800")
{
info0 = 218800 ; Product ID
info1 = Core 365 Ladies Lightweight Full-Zip Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 218700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records218800%
}

Else If InStr(trimmedString, "/218900")
{
info0 = 218900 ; Product ID
info1 = Core 365 Waterproof Ripstop Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat52 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = There is reflective tape at right chest and front pockets ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 29.99
thisrecord1 = %records218900%
}

Else If InStr(trimmedString, "/219100")
{
info0 = 219100 ; Product ID
info1 = Ultra Club Short Sleeve Wrinkle-Free Oxford Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.43
thisrecord1 = %records219100%
}

Else If InStr(trimmedString, "/219200")
{
info0 = 219200 ; Product ID
info1 = Featherlite Short Sleeve Stain Resistant Twill Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat35 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.2
thisrecord1 = %records219200%
}

Else If InStr(trimmedString, "/219300")
{
info0 = 219300 ; Product ID
info1 = Ultra Club Easy Care Broadcloth Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab96 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 219800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.59
thisrecord1 = %records219300%
}

Else If InStr(trimmedString, "/219400")
{
info0 = 219400 ; Product ID
info1 = Van Heusen Gingham Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.58
thisrecord1 = %records219400%
}

Else If InStr(trimmedString, "/219500")
{
info0 = 219500 ; Product ID
info1 = Van Heusen Baby Twill Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab98 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 220000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.58
thisrecord1 = %records219500%
}

Else If InStr(trimmedString, "/219600")
{
info0 = 219600 ; Product ID
info1 = Port Authority Crosshatch Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab98 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Care Instructions: Machine wash with like colors. No fabric softeners or chlorinated bleach. Tumble dry and hang up immediately. ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.99
thisrecord1 = %records219600%
}

Else If InStr(trimmedString, "/219700")
{
info0 = 219700 ; Product ID
info1 = Port Authority Stretch Poplin Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab100 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 220100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records219700%
}

Else If InStr(trimmedString, "/219800")
{
info0 = 219800 ; Product ID
info1 = Ultra Club Ladies Easy Care Broadcloth Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab96 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 219300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.59
thisrecord1 = %records219800%
}

Else If InStr(trimmedString, "/219900")
{
info0 = 219900 ; Product ID
info1 = Port Authority Ladies 3/4 Sleeve Easy Care Twill Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records219900%
}

Else If InStr(trimmedString, "/220000")
{
info0 = 220000 ; Product ID
info1 = Van Heusen Ladies 3/4 Sleeve Baby Twill Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab98 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 219500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.58
thisrecord1 = %records220000%
}

Else If InStr(trimmedString, "/220100")
{
info0 = 220100 ; Product ID
info1 = Port Authority Ladies Stretch Poplin Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab100 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 219700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Care Instructions: Machine wash with like colors. No fabric softeners or chlorinated bleach. Tumble dry and hang up immediately. ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records220100%
}

Else If InStr(trimmedString, "/220200")
{
info0 = 220200 ; Product ID
info1 = Port Authority Puffy Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab73 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 220300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records220200%
}

Else If InStr(trimmedString, "/220300")
{
info0 = 220300 ; Product ID
info1 = Port Authority Ladies Puffy Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab73 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 220200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records220300%
}

Else If InStr(trimmedString, "/220400")
{
info0 = 220400 ; Product ID
info1 = Port Authority Colorblock Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 220500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records220400%
}

Else If InStr(trimmedString, "/220500")
{
info0 = 220500 ; Product ID
info1 = Port Authority Ladies Colorblock Soft Shell Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat48 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 220400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records220500%
}

Else If InStr(trimmedString, "/220600")
{
info0 = 220600 ; Product ID
info1 = Port Authority Microfiber Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab68 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 26.99
thisrecord1 = %records220600%
}

Else If InStr(trimmedString, "/220700")
{
info0 = 220700 ; Product ID
info1 = Ultra Club 1/4 Zip Hooded Packable Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab70 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records220700%
}

Else If InStr(trimmedString, "/220800")
{
info0 = 220800 ; Product ID
info1 = Ultra Club Full-Zip Hooded Packable Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab70 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.83
thisrecord1 = %records220800%
}

Else If InStr(trimmedString, "/220900")
{
info0 = 220900 ; Product ID
info1 = Sport-Tek Coaches Jacket ; Product Title
info2 := cat3 ; Product Category
info3 := subcat53 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab21 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records220900%
}

Else If InStr(trimmedString, "/221000")
{
info0 = 221000 ; Product ID
info1 = Ultra Club Wrinkle-Free Oxford Dress Shirt ; Product Title
info2 := cat9 ; Product Category
info3 := subcat34 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab99 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.35
thisrecord1 = %records221000%
}

Else If InStr(trimmedString, "/221100")
{
info0 = 221100 ; Product ID
info1 = Bella Juniors Capri Pant ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab77 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Comfortable elastic waistband ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.45
thisrecord1 = %records221100%
}

Else If InStr(trimmedString, "/221200")
{
info0 = 221200 ; Product ID
info1 = Gildan Double Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab58 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.8
thisrecord1 = %records221200%
}

Else If InStr(trimmedString, "/221300")
{
info0 = 221300 ; Product ID
info1 = Gildan Ladies Double Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab58 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 221200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.8
thisrecord1 = %records221300%
}

Else If InStr(trimmedString, "/221400")
{
info0 = 221400 ; Product ID
info1 = Gildan Dryblend Double Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab56 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 246600 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 242600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.8
thisrecord1 = %records221400%
}

Else If InStr(trimmedString, "/221500")
{
info0 = 221500 ; Product ID
info1 = Devon & Jones Pima Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab55 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Grey Heather is a cotton/poly blend ; Product Exceptions
info18 = 10.99
thisrecord1 = %records221500%
}

Else If InStr(trimmedString, "/221600")
{
info0 = 221600 ; Product ID
info1 = Devon & Jones Ladies Pima Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab55 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Grey Heather is a cotton/poly blend ; Product Exceptions
info18 = 10.99
thisrecord1 = %records221600%
}

Else If InStr(trimmedString, "/221700")
{
info0 = 221700 ; Product ID
info1 = Izod Silkwash Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab59 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.25
thisrecord1 = %records221700%
}

Else If InStr(trimmedString, "/221800")
{
info0 = 221800 ; Product ID
info1 = Hanes X-Temp Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.12
thisrecord1 = %records221800%
}

Else If InStr(trimmedString, "/221900")
{
info0 = 221900 ; Product ID
info1 = Hanes Ladies X-Temp Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.41
thisrecord1 = %records221900%
}

Else If InStr(trimmedString, "/222000")
{
info0 = 222000 ; Product ID
info1 = Port Authority Stain Resistant Pocket Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 222100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records222000%
}

Else If InStr(trimmedString, "/222100")
{
info0 = 222100 ; Product ID
info1 = Port Authority Ladies Stain Resistant Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab53 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 222000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records222100%
}

Else If InStr(trimmedString, "/222200")
{
info0 = 222200 ; Product ID
info1 = Port Authority Silk Touch Long Sleeve Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab57 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records222200%
}

Else If InStr(trimmedString, "/222300")
{
info0 = 222300 ; Product ID
info1 = Canada - American Apparel Tri-Blend T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 224100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.3
thisrecord1 = %records222300%
}

Else If InStr(trimmedString, "/222400")
{
info0 = 222400 ; Product ID
info1 = Canada - American Apparel Tri-Blend V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.6
thisrecord1 = %records222400%
}

Else If InStr(trimmedString, "/222600")
{
info0 = 222600 ; Product ID
info1 = Canada - Fruit of the Loom 100`% Cotton Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are a poly/cotton blend ; Product Exceptions
info18 = 4
thisrecord1 = %records222600%
}

Else If InStr(trimmedString, "/222700")
{
info0 = 222700 ; Product ID
info1 = Canada - Jerzees Lightweight 100`% Cotton T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 224700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.23
thisrecord1 = %records222700%
}

Else If InStr(trimmedString, "/222900")
{
info0 = 222900 ; Product ID
info1 = Canada - Jerzees Lightweight 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 4.1
thisrecord1 = %records222900%
}

Else If InStr(trimmedString, "/223000")
{
info0 = 223000 ; Product ID
info1 = Canada - Jerzees 50/50 T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 224800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.52
thisrecord1 = %records223000%
}

Else If InStr(trimmedString, "/223100")
{
info0 = 223100 ; Product ID
info1 = Canada - Jerzees 50/50 Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.03
thisrecord1 = %records223100%
}

Else If InStr(trimmedString, "/223200")
{
info0 = 223200 ; Product ID
info1 = Canada - Jerzees 50/50 Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.18
thisrecord1 = %records223200%
}

Else If InStr(trimmedString, "/223300")
{
info0 = 223300 ; Product ID
info1 = Canada - Gildan Softstyle Jersey V-Neck T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 4.27
thisrecord1 = %records223300%
}

Else If InStr(trimmedString, "/223400")
{
info0 = 223400 ; Product ID
info1 = Canada - Gildan Softstyle Long Sleeve Jersey T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 5.35
thisrecord1 = %records223400%
}

Else If InStr(trimmedString, "/223500")
{
info0 = 223500 ; Product ID
info1 = Canada - Gildan Ultra Cotton Long Sleeve Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 6.09
thisrecord1 = %records223500%
}

Else If InStr(trimmedString, "/223600")
{
info0 = 223600 ; Product ID
info1 = Canada - Gildan Ultra Cotton Tall T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Sports Grey is a poly/cotton blend ; Product Exceptions
info18 = 5.73
thisrecord1 = %records223600%
}

Else If InStr(trimmedString, "/223700")
{
info0 = 223700 ; Product ID
info1 = Canada - Dyenomite 100`% Cotton Rainbow Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.11
thisrecord1 = %records223700%
}

Else If InStr(trimmedString, "/223800")
{
info0 = 223800 ; Product ID
info1 = Canada - Dyenomite 100`% Cotton Tonal Tie-Dye T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Each shirt is individually hand tied and dyed, meaning the pattern will vary on each shirt. Due to the tie dye process shirts may vary slightly from the provided measurements  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.11
thisrecord1 = %records223800%
}

Else If InStr(trimmedString, "/223900")
{
info0 = 223900 ; Product ID
info1 = Canada - Code 5 Camo T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 231400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.45
thisrecord1 = %records223900%
}

Else If InStr(trimmedString, "/224000")
{
info0 = 224000 ; Product ID
info1 = Canada - Code 5 Digital Camo T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.45
thisrecord1 = %records224000%
}

Else If InStr(trimmedString, "/224100")
{
info0 = 224100 ; Product ID
info1 = Canada - American Apparel Juniors Tri-Blend T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 222300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.54
thisrecord1 = %records224100%
}

Else If InStr(trimmedString, "/224200")
{
info0 = 224200 ; Product ID
info1 = Canada - American Apparel Juniors 50/50 T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 153100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.83
thisrecord1 = %records224200%
}

Else If InStr(trimmedString, "/224300")
{
info0 = 224300 ; Product ID
info1 = Canada - Bella Juniors Tri-Blend Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records224300%
}

Else If InStr(trimmedString, "/224400")
{
info0 = 224400 ; Product ID
info1 = Canada - Bella Juniors Flowy Boxy Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab148 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.53
thisrecord1 = %records224400%
}

Else If InStr(trimmedString, "/224500")
{
info0 = 224500 ; Product ID
info1 = Canada - Bella Juniors Yoga Pant ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab77 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Comfortable elastic waistband`r`n- Slightly flared leg opening`r`n- Stylish longer length ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.94
thisrecord1 = %records224500%
}

Else If InStr(trimmedString, "/224600")
{
info0 = 224600 ; Product ID
info1 = Canada - American Apparel Toddler Jersey T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Heather Grey is a poly/cotton blend  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.02
thisrecord1 = %records224600%
}

Else If InStr(trimmedString, "/224700")
{
info0 = 224700 ; Product ID
info1 = Canada - Jerzees Youth Lightweight 100`% Cotton T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 222700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.14
thisrecord1 = %records224700%
}

Else If InStr(trimmedString, "/224800")
{
info0 = 224800 ; Product ID
info1 = Canada - Jerzees Youth 50/50 T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab2 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 223000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.08
thisrecord1 = %records224800%
}

Else If InStr(trimmedString, "/224900")
{
info0 = 224900 ; Product ID
info1 = Gildan Ladies 100`% Cotton V-Neck T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 04100 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Sport Grey is a poly/cotton blend ; Product Exceptions
info18 = 2.38
thisrecord1 = %records224900%
}

Else If InStr(trimmedString, "/225000")
{
info0 = 225000 ; Product ID
info1 = Anvil Tri-Blend Raglan ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.82
thisrecord1 = %records225000%
}

Else If InStr(trimmedString, "/225100")
{
info0 = 225100 ; Product ID
info1 = Canvas Jersey Contrast Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 5.86
thisrecord1 = %records225100%
}

Else If InStr(trimmedString, "/225200")
{
info0 = 225200 ; Product ID
info1 = Sport-Tek Tough Mesh Baseball Henley ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab30 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Tag with size information is sewn on bottom left  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records225200%
}

Else If InStr(trimmedString, "/225300")
{
info0 = 225300 ; Product ID
info1 = Sport-Tek Tough Mesh Full Button Baseball Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab30 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Tag with size information is sewn on bottom left  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.99
thisrecord1 = %records225300%
}

Else If InStr(trimmedString, "/225400")
{
info0 = 225400 ; Product ID
info1 = Sport-Tek Competitor Performance Muscle Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 225500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.99
thisrecord1 = %records225400%
}

Else If InStr(trimmedString, "/225600")
{
info0 = 225600 ; Product ID
info1 = Devon & Jones Tipped Pima Interlock Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab55 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 228700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Grey Heather is a cotton/poly blend ; Product Exceptions
info18 = 12.35
thisrecord1 = %records225600%
}

Else If InStr(trimmedString, "/225700")
{
info0 = 225700 ; Product ID
info1 = Canada - Rabbit Skins Infant T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.73
thisrecord1 = %records225700%
}

Else If InStr(trimmedString, "/225800")
{
info0 = 225800 ; Product ID
info1 = Devon & Jones Pima Interlock Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab55 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.35
thisrecord1 = %records225800%
}

Else If InStr(trimmedString, "/225900")
{
info0 = 225900 ; Product ID
info1 = Gildan 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 193700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors poly/cotton blends ; Product Exceptions
info18 = 3.71
thisrecord1 = %records225900%
}

Else If InStr(trimmedString, "/226000")
{
info0 = 226000 ; Product ID
info1 = Sport-Tek Heather Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 228000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.99
thisrecord1 = %records226000%
}

Else If InStr(trimmedString, "/226100")
{
info0 = 226100 ; Product ID
info1 = Ultra Club Cool & Dry Jacquard Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab64 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.97
thisrecord1 = %records226100%
}

Else If InStr(trimmedString, "/226200")
{
info0 = 226200 ; Product ID
info1 = Port Authority Diamond Jacquard Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab64 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Sleek side paneling  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records226200%
}

Else If InStr(trimmedString, "/226300")
{
info0 = 226300 ; Product ID
info1 = Jerzees Micro-Mesh Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab61 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.25
thisrecord1 = %records226300%
}

Else If InStr(trimmedString, "/226400")
{
info0 = 226400 ; Product ID
info1 = Canada - Rabbit Skins Toddler T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat72 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blend ; Product Exceptions
info18 = 2.57
thisrecord1 = %records226400%
}

Else If InStr(trimmedString, "/226500")
{
info0 = 226500 ; Product ID
info1 = CornerStone Snag-Proof Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 12.99
thisrecord1 = %records226500%
}

Else If InStr(trimmedString, "/226600")
{
info0 = 226600 ; Product ID
info1 = Champion Double Dry Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 228800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Longer back split tail  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.5
thisrecord1 = %records226600%
}

Else If InStr(trimmedString, "/226700")
{
info0 = 226700 ; Product ID
info1 = Ultra Club Mesh Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab62 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 228100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.98
thisrecord1 = %records226700%
}

Else If InStr(trimmedString, "/226800")
{
info0 = 226800 ; Product ID
info1 = Core 365 Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab36 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.49
thisrecord1 = %records226800%
}

Else If InStr(trimmedString, "/227000")
{
info0 = 227000 ; Product ID
info1 = Team 365 Contrast Mesh Cinchpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat43 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 12,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.99
thisrecord1 = %records227000%
}

Else If InStr(trimmedString, "/227100")
{
info0 = 227100 ; Product ID
info1 = Adidas ClimaLite Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Longer back tail  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.95
thisrecord1 = %records227100%
}

Else If InStr(trimmedString, "/227200")
{
info0 = 227200 ; Product ID
info1 = Nike Golf Dri-FIT Micro Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab36 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 228400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.85
thisrecord1 = %records227200%
}

Else If InStr(trimmedString, "/227300")
{
info0 = 227300 ; Product ID
info1 = Adidas ClimaLite Three Stripe Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.58
thisrecord1 = %records227300%
}

Else If InStr(trimmedString, "/227500")
{
info0 = 227500 ; Product ID
info1 = Anvil Ladies Tri-Blend Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.55
thisrecord1 = %records227500%
}

Else If InStr(trimmedString, "/227600")
{
info0 = 227600 ; Product ID
info1 = Port Authority Ladies Silk Touch Colorblock Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 228200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records227600%
}

Else If InStr(trimmedString, "/227700")
{
info0 = 227700 ; Product ID
info1 = CornerStone Snag-Proof Colorblock Pocket Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records227700%
}

Else If InStr(trimmedString, "/227800")
{
info0 = 227800 ; Product ID
info1 = Canada - Rabbit Skins Infant One-piece ; Product Title
info2 := cat8 ; Product Category
info3 := subcat73 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.59
thisrecord1 = %records227800%
}

Else If InStr(trimmedString, "/227900")
{
info0 = 227900 ; Product ID
info1 = Canada - Jerzees Youth 50/50 Hooded Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 229300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.63
thisrecord1 = %records227900%
}

Else If InStr(trimmedString, "/228000")
{
info0 = 228000 ; Product ID
info1 = Sport-Tek Ladies Heather Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 226000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.99
thisrecord1 = %records228000%
}

Else If InStr(trimmedString, "/228100")
{
info0 = 228100 ; Product ID
info1 = Ultra Club Ladies Mesh Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab62 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 226700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.98
thisrecord1 = %records228100%
}

Else If InStr(trimmedString, "/228200")
{
info0 = 228200 ; Product ID
info1 = Port Authority Silk Touch Colorblock Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 227600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.99
thisrecord1 = %records228200%
}

Else If InStr(trimmedString, "/228300")
{
info0 = 228300 ; Product ID
info1 = Gildan Ultra Cotton Muscle Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Sports Grey and Safety colors are poly/cotton blends ; Product Exceptions
info18 = 3.79
thisrecord1 = %records228300%
}

Else If InStr(trimmedString, "/228400")
{
info0 = 228400 ; Product ID
info1 = Nike Golf Ladies Dri-FIT Micro Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 227200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.85
thisrecord1 = %records228400%
}

Else If InStr(trimmedString, "/228500")
{
info0 = 228500 ; Product ID
info1 = Nike Golf Dri-FIT Shoulder Stripe Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 20.67
thisrecord1 = %records228500%
}

Else If InStr(trimmedString, "/228700")
{
info0 = 228700 ; Product ID
info1 = Devon & Jones Ladies Tipped Pima Interlock Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat25 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab55 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 225600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Grey Heather is a cotton/poly blend ; Product Exceptions
info18 = 12.35
thisrecord1 = %records228700%
}

Else If InStr(trimmedString, "/228800")
{
info0 = 228800 ; Product ID
info1 = Champion Ladies Double Dry Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 226600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Longer back split tail  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = Champion Ladies Double Dry Performance Polo
thisrecord1 = %records228800%
}

Else If InStr(trimmedString, "/228900")
{
info0 = 228900 ; Product ID
info1 = Canada - Gildan Youth Lightweight Crewneck Sweatshirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat81 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 152600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.3
thisrecord1 = %records228900%
}

Else If InStr(trimmedString, "/229000")
{
info0 = 229000 ; Product ID
info1 = Canada - Gildan 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13
thisrecord1 = %records229000%
}

Else If InStr(trimmedString, "/229100")
{
info0 = 229100 ; Product ID
info1 = Canada - Gildan Ladies Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 153400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.63
thisrecord1 = %records229100%
}

Else If InStr(trimmedString, "/229200")
{
info0 = 229200 ; Product ID
info1 = Canada - Gildan Ladies Open Bottom Sweatpants ; Product Title
info2 := cat14 ; Product Category
info3 := subcat61 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab75 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.48
thisrecord1 = %records229200%
}

Else If InStr(trimmedString, "/229300")
{
info0 = 229300 ; Product ID
info1 = Canada - Jerzees 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 227900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.42
thisrecord1 = %records229300%
}

Else If InStr(trimmedString, "/229400")
{
info0 = 229400 ; Product ID
info1 = Canada - Alternative Apparel Juniors Tri-Blend Wideneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab147 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Raw-edge neckline and raglan sleeves ; Product Exceptions
info18 = 20.32
thisrecord1 = %records229400%
}

Else If InStr(trimmedString, "/229500")
{
info0 = 229500 ; Product ID
info1 = Canada - Code 5 Camo Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Camo pattern will vary on each sweatshirt. ; Product Exceptions
info18 = 24.26
thisrecord1 = %records229500%
}

Else If InStr(trimmedString, "/229600")
{
info0 = 229600 ; Product ID
info1 = Hanes Ladies Cool Dri Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 204500 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 206800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.6
thisrecord1 = %records229600%
}

Else If InStr(trimmedString, "/229700")
{
info0 = 229700 ; Product ID
info1 = Anvil Ladies Jersey Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 3.17
thisrecord1 = %records229700%
}

Else If InStr(trimmedString, "/229800")
{
info0 = 229800 ; Product ID
info1 = Canada - New Balance Ladies Tempo Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 230100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records229800%
}

Else If InStr(trimmedString, "/229900")
{
info0 = 229900 ; Product ID
info1 = Canada - New Balance Ladies Tempo Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 230200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.42
thisrecord1 = %records229900%
}

Else If InStr(trimmedString, "/230000")
{
info0 = 230000 ; Product ID
info1 = Canada - New Balance Ladies Tempo Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 230500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.46
thisrecord1 = %records230000%
}

Else If InStr(trimmedString, "/230100")
{
info0 = 230100 ; Product ID
info1 = Canada - New Balance Tempo Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 229800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.99
thisrecord1 = %records230100%
}

Else If InStr(trimmedString, "/230200")
{
info0 = 230200 ; Product ID
info1 = Canada - New Balance Tempo Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 229900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records230200%
}

Else If InStr(trimmedString, "/230500")
{
info0 = 230500 ; Product ID
info1 = Canada - New Balance Tempo Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab37 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 230000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Racerback fit for full range of motion  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.03
thisrecord1 = %records230500%
}

Else If InStr(trimmedString, "/230600")
{
info0 = 230600 ; Product ID
info1 = Canada - All Sport Performance Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab39 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.81
thisrecord1 = %records230600%
}

Else If InStr(trimmedString, "/230800")
{
info0 = 230800 ; Product ID
info1 = Canada - All Sport Performance Baseball Raglan ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.24
thisrecord1 = %records230800%
}

Else If InStr(trimmedString, "/231000")
{
info0 = 231000 ; Product ID
info1 = Canada - All Sport Ladies Performance Racerback Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 230600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Longer body length and curved bottom hem  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.34
thisrecord1 = %records231000%
}

Else If InStr(trimmedString, "/231200")
{
info0 = 231200 ; Product ID
info1 = CornerStone Snag-Proof Tactical Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = wrinkle resistant and has mic clips at center placket and shoulders  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.99
thisrecord1 = %records231200%
}

Else If InStr(trimmedString, "/231300")
{
info0 = 231300 ; Product ID
info1 = Next Level Juniors Jersey Racerback Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab146 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 2.92
thisrecord1 = %records231300%
}

Else If InStr(trimmedString, "/231400")
{
info0 = 231400 ; Product ID
info1 = Canada - Code 5 Youth Camo T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 223900 ; Product Youth Adult ID
info16 = 2`% of all Code V sales are donated to Children of Fallen Soldiers Relief Fund, Inc; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8
thisrecord1 = %records231400%
}

Else If InStr(trimmedString, "/231600")
{
info0 = 231600 ; Product ID
info1 = Callaway Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 231700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.25
thisrecord1 = %records231600%
}

Else If InStr(trimmedString, "/231700")
{
info0 = 231700 ; Product ID
info1 = Callaway Ladies Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 231600 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Curved bottom hem  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.25
thisrecord1 = %records231700%
}

Else If InStr(trimmedString, "/231800")
{
info0 = 231800 ; Product ID
info1 = Callaway Micro Pique Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab36 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Sporty split front shoulder stitching  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 20.25
thisrecord1 = %records231800%
}

Else If InStr(trimmedString, "/231900")
{
info0 = 231900 ; Product ID
info1 = Adidas ClimaLite Textured Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.61
thisrecord1 = %records231900%
}

Else If InStr(trimmedString, "/231900")
{
info0 = 231900 ; Product ID
info1 = Adidas ClimaLite Textured Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.61
thisrecord1 = %records231900%
}

Else If InStr(trimmedString, "/232000")
{
info0 = 232000 ; Product ID
info1 = Nike Golf Dri-FIT Tipped Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records232000%
}

Else If InStr(trimmedString, "/232100")
{
info0 = 232100 ; Product ID
info1 = Adidas ClimaLite Pencil Stripe Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records232100%
}

Else If InStr(trimmedString, "/232200")
{
info0 = 232200 ; Product ID
info1 = Nike Golf Dri-FIT Textured Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab64 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 26.31
thisrecord1 = %records232200%
}

Else If InStr(trimmedString, "/237200")
{
info0 = 237200 ; Product ID
info1 = Canada - ATC Competitor Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 237700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.47
thisrecord1 = %records237200%
}

Else If InStr(trimmedString, "/237300")
{
info0 = 237300 ; Product ID
info1 = Canada - ATC Competitor Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.55
thisrecord1 = %records237300%
}

Else If InStr(trimmedString, "/237400")
{
info0 = 237400 ; Product ID
info1 = Canada - ATC Competitor Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 237800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.69
thisrecord1 = %records237400%
}

Else If InStr(trimmedString, "/237500")
{
info0 = 237500 ; Product ID
info1 = Canada - ATC Dri-Mesh Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab41 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records237500%
}

Else If InStr(trimmedString, "/237700")
{
info0 = 237700 ; Product ID
info1 = Canada - ATC Ladies Competitor Colorblock Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 237200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.47
thisrecord1 = %records237700%
}

Else If InStr(trimmedString, "/237800")
{
info0 = 237800 ; Product ID
info1 = Canada - ATC Ladies Competitor Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 1 ; Product Gender
info13 = 237400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.69
thisrecord1 = %records237800%
}

Else If InStr(trimmedString, "/237900")
{
info0 = 237900 ; Product ID
info1 = Canada - ATC Mesh Reversible Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 238200 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Sport-Tek Mesh Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.4
thisrecord1 = %records237900%
}

Else If InStr(trimmedString, "/238200")
{
info0 = 238200 ; Product ID
info1 = Canada - ATC Youth Mesh Reversible Tank ; Product Title
info2 := cat8 ; Product Category
info3 := subcat85 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 237900 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.4
thisrecord1 = %records238200%
}

Else If InStr(trimmedString, "/238300")
{
info0 = 238300 ; Product ID
info1 = Canada - ATC Youth Mesh Shorts ; Product Title
info2 := cat8 ; Product Category
info3 := subcat82 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 239300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Elastic waist with nylon drawstring (adult sizes only) ; Product Exceptions
info18 = 7.4
thisrecord1 = %records238300%
}

Else If InStr(trimmedString, "/238900")
{
info0 = 238900 ; Product ID
info1 = Canada - Coal Harbour Silk Touch Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.47
thisrecord1 = %records238900%
}

Else If InStr(trimmedString, "/239000")
{
info0 = 239000 ; Product ID
info1 = Canada - Coal Harbour Ladies Silk Touch Performance Polo ; Product Title
info2 := cat3 ; Product Category
info3 := subcat15 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.47
thisrecord1 = %records239000%
}

Else If InStr(trimmedString, "/239300")
{
info0 = 239300 ; Product ID
info1 = Canada - ATC Mesh Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 238300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Elastic waist with nylon drawstring (adult sizes only) ; Product Exceptions
info18 = 7.4
thisrecord1 = %records239300%
}

Else If InStr(trimmedString, "/239400")
{
info0 = 239400 ; Product ID
info1 = Canada - ATC Competitor Performance Muscle Tank ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 239500 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.62
thisrecord1 = %records239400%
}

Else If InStr(trimmedString, "/239600")
{
info0 = 239600 ; Product ID
info1 = Team 365 Large Duffel Bag ; Product Title
info2 := cat11 ; Product Category
info3 := subcat44 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 10.99
thisrecord1 = %records239600%
}

Else If InStr(trimmedString, "/239700")
{
info0 = 239700 ; Product ID
info1 = Canada - ATC Dri-Mesh Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab41 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records239700%
}

Else If InStr(trimmedString, "/240900")
{
info0 = 240900 ; Product ID
info1 = A4 Youth Promotional Performance Shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat86 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 213600 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 3.29
thisrecord1 = %records240900%
}

Else If InStr(trimmedString, "/241500")
{
info0 = 241500 ; Product ID
info1 = Canvas Muscle Tank ; Product Title
info2 := cat1 ; Product Category
info3 := subcat3 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather colors are poly/cotton blends ; Product Exceptions
info18 = 3.9
thisrecord1 = %records241500%
}

Else If InStr(trimmedString, "/241600")
{
info0 = 241600 ; Product ID
info1 = Bella Juniors Flowy Muscle Tank ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab148 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.09
thisrecord1 = %records241600%
}

Else If InStr(trimmedString, "/241700")
{
info0 = 241700 ; Product ID
info1 = LAT Ladies Baseball Raglan ; Product Title
info2 := cat2 ; Product Category
info3 := subcat7 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.55
thisrecord1 = %records241700%
}

Else If InStr(trimmedString, "/242000")
{
info0 = 242000 ; Product ID
info1 = Canvas Tri-Blend T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 242200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.59
thisrecord1 = %records242000%
}

Else If InStr(trimmedString, "/242100")
{
info0 = 242100 ; Product ID
info1 = Canada - Gildan Youth Zip Hoodie ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 153400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.29
thisrecord1 = %records242100%
}

Else If InStr(trimmedString, "/242200")
{
info0 = 242200 ; Product ID
info1 = Bella Ladies Tri-Blend T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat6 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab3 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 242000 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.59
thisrecord1 = %records242200%
}

Else If InStr(trimmedString, "/242500")
{
info0 = 242500 ; Product ID
info1 = Gildan Youth Zip Hoodie ; Product Title
info2 := cat8 ; Product Category
info3 := subcat80 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 119700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.71
thisrecord1 = %records242500%
}

Else If InStr(trimmedString, "/242600")
{
info0 = 242600 ; Product ID
info1 = Gildan Youth Dryblend Double Pique Polo ; Product Title
info2 := cat8 ; Product Category
info3 := subcat79 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab56 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 221400 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.49
thisrecord1 = %records242600%
}

Else If InStr(trimmedString, "/242800")
{
info0 = 242800 ; Product ID
info1 = District Youth Concert T-shirt ; Product Title
info2 := cat8 ; Product Category
info3 := subcat66 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 211200 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 2.3
thisrecord1 = %records242800%
}

Else If InStr(trimmedString, "/242900")
{
info0 = 242900 ; Product ID
info1 = Team 365 Sport Duffel Bag ; Product Title
info2 := cat11 ; Product Category
info3 := subcat44 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.99
thisrecord1 = %records242900%
}

Else If InStr(trimmedString, "/243000")
{
info0 = 243000 ; Product ID
info1 = Foldable Can KOOZIE ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab114 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records243000%
}

Else If InStr(trimmedString, "/243100")
{
info0 = 243100 ; Product ID
info1 = Fancy Edge Foldable Can KOOZIE ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab114 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records243100%
}

Else If InStr(trimmedString, "/243200")
{
info0 = 243200 ; Product ID
info1 = Deluxe Vinyl Foldable Can KOOZIE ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab116 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 100,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records243200%
}

Else If InStr(trimmedString, "/243300")
{
info0 = 243300 ; Product ID
info1 = Foldable Large Bottle KOOZIE ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab114 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records243300%
}

Else If InStr(trimmedString, "/243400")
{
info0 = 243400 ; Product ID
info1 = Foldable Large Bottle KOOZIE w/ carabiner ; Product Title
info2 := cat6 ; Product Category
info3 := subcat26 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab119 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records243400%
}

Else If InStr(trimmedString, "/243500")
{
info0 = 243500 ; Product ID
info1 = Totes Auto Open Compact Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab140 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = 21 day turn time on 2 color designs ; Product Exceptions
info18 = 7
info19 = 7
thisrecord1 = %records243500%
}

Else If InStr(trimmedString, "/243600")
{
info0 = 243600 ; Product ID
info1 = Vitronic Solid Auto Open Compact Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab140 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = 21 day turn time for 2 color designs ; Product Exceptions
info18 = 7
info19 = 7
thisrecord1 = %records243600%
}

Else If InStr(trimmedString, "/243700")
{
info0 = 243700 ; Product ID
info1 = Vitronic Multi-Tone Auto Open Compact Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab140 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = 21 day turn time on 2 color designs ; Product Exceptions
info18 = 7
info19 = 7
thisrecord1 = %records243700%
}

Else If InStr(trimmedString, "/243800")
{
info0 = 243800 ; Product ID
info1 = Vitronic Multi-Tone Auto Open Vented Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab142 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Double canopy that will withstand strong wind gusts  ; Product Comment One
info17 = 21 day turn time for 2 color designs ; Product Exceptions
info18 = 7
info19 = 7
thisrecord1 = %records243800%
}

Else If InStr(trimmedString, "/243900")
{
info0 = 243900 ; Product ID
info1 = Vitronic Wind Tamer Vented Golf Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab142 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = 21 day turn time on 2 color designs ; Product Exceptions
info18 = 15
info19 = 15
thisrecord1 = %records243900%
}

Else If InStr(trimmedString, "/244000")
{
info0 = 244000 ; Product ID
info1 = Totes Stormbeater Golf Stick Umbrella ; Product Title
info2 := cat15 ; Product Category
info3 := subcat74 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab142 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 25,2 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = 21 day turn time on 2 color designs ; Product Exceptions
info18 = 15
info19 = 15
thisrecord1 = %records244000%
}

Else If InStr(trimmedString, "/244100")
{
info0 = 244100 ; Product ID
info1 = Team 365 Convertible Sport Backpack ; Product Title
info2 := cat11 ; Product Category
info3 := subcat44 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab105 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,4 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 21.99
thisrecord1 = %records244100%
}

Else If InStr(trimmedString, "/244200")
{
info0 = 244200 ; Product ID
info1 = Canada - Canvas Lightweight Baseball Raglan ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab149 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.73
thisrecord1 = %records244200%
}

Else If InStr(trimmedString, "/244900")
{
info0 = 244900 ; Product ID
info1 = Hanes Cool Dri Long Sleeve Performance Shirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat11 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.81
thisrecord1 = %records244900%
}
Else If InStr(trimmedString, "/245000")
{
info0 = 245000 ; Product ID
info1 = Fruit of the Loom 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather & neon colors are a poly/cotton blend ; Product Exceptions
info18 = 3.51
thisrecord1 = %records245000%
}

Else If InStr(trimmedString, "/245100")
{
info0 = 245100 ; Product ID
info1 = Jerzees Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab42 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.15
thisrecord1 = %records245100%
}

Else If InStr(trimmedString, "/245200")
{
info0 = 245200 ; Product ID
info1 = Jerzees Performance Zip Hoodie ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab42 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.41
thisrecord1 = %records245200%
}

Else If InStr(trimmedString, "/245300")
{
info0 = 245300 ; Product ID
info1 = Champion Vapor 1/4 Zip Performance Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Contrast interior collar  ; Product Comment One
info18 = 18.48
info17 = empty ; Product Exceptions
info18 = 18.48
thisrecord1 = %records245300%
}

Else If InStr(trimmedString, "/245400")
{
info0 = 245400 ; Product ID
info1 = Adidas ClimaLite 1/4 Zip Performance Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab25 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Contrast three stripe self-fabric detail on left sleeve  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 27.75
thisrecord1 = %records245400%
}

Else If InStr(trimmedString, "/245500")
{
info0 = 245500 ; Product ID
info1 = Devon & Jones Heather 1/4 Zip Performance Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Drawstring bottom hem with dual barrel stoppers  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records245500%
}

Else If InStr(trimmedString, "/245600")
{
info0 = 245600 ; Product ID
info1 = Devon & Jones Heather Performance Full-Zip ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Drawstring bottom hem with dual barrel stoppers  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 19.99
thisrecord1 = %records245600%
}

Else If InStr(trimmedString, "/245700")
{
info0 = 245700 ; Product ID
info1 = Port Authority Contrast Tote ; Product Title
info2 := cat11 ; Product Category
info3 := subcat42 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab103 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 6,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.57
thisrecord1 = %records245700%
}

Else If InStr(trimmedString, "/245800")
{
info0 = 245800 ; Product ID
info1 = Ogio Contrast Performance Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab83 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.63
thisrecord1 = %records245800%
}

Else If InStr(trimmedString, "/245900")
{
info0 = 245900 ; Product ID
info1 = Adidas Core Performance Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab83 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.18
thisrecord1 = %records245900%
}

Else If InStr(trimmedString, "/246000")
{
info0 = 246000 ; Product ID
info1 = Adidas Contrast Heather Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab88 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.84
thisrecord1 = %records246000%
}

Else If InStr(trimmedString, "/246100")
{
info0 = 246100 ; Product ID
info1 = Adidas Tour Mesh Performance Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab83 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.84
thisrecord1 = %records246100%
}

Else If InStr(trimmedString, "/246200")
{
info0 = 246200 ; Product ID
info1 = Nike Golf Dri-FIT Stretch Performance Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab84 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.39
thisrecord1 = %records246200%
}

Else If InStr(trimmedString, "/246300")
{
info0 = 246300 ; Product ID
info1 = Nike Golf Stretch Fit Mesh Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab87 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = Nike Golf Stretch Fit Mesh Hat
thisrecord1 = %records246300%
}

Else If InStr(trimmedString, "/246400")
{
info0 = 246400 ; Product ID
info1 = Nike Golf Twill Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat71 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab82 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.57
thisrecord1 = %records246400%
}

Else If InStr(trimmedString, "/246600")
{
info0 = 246600 ; Product ID
info1 = Gildan Ladies Dryblend Double Pique Polo ; Product Title
info2 := cat5 ; Product Category
info3 := subcat24 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab56 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 221400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.12
thisrecord1 = %records246600%
}

Else If InStr(trimmedString, "/246700")
{
info0 = 246700 ; Product ID
info1 = Fruit of the Loom Sofspun Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.62
thisrecord1 = %records246700%
}

Else If InStr(trimmedString, "/246800")
{
info0 = 246800 ; Product ID
info1 = Fruit of the Loom Sofspun Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.1
thisrecord1 = %records246800%
}

Else If InStr(trimmedString, "/246900")
{
info0 = 246900 ; Product ID
info1 = Fruit of the Loom Sofspun Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.03
thisrecord1 = %records246900%
}

Else If InStr(trimmedString, "/247000")
{
info0 = 247000 ; Product ID
info1 = Canada - Fruit of the Loom 100`% Cotton Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country2 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather & neon colors are a poly/cotton blend ; Product Exceptions
info18 = 4.06
thisrecord1 = %records247000%
}

Else If InStr(trimmedString, "/247600")
{
info0 = 247600 ; Product ID
info1 = Teamwork Cascade Soccer Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab29 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.61
thisrecord1 = %records247600%
}

Else If InStr(trimmedString, "/247800")
{
info0 = 247800 ; Product ID
info1 = Teamwork Overtime Replica Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 247900 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Yoke and sleeves - 100`% polyester dazzle fabric ; Product Comment One
info17 = Not meant to be worn with pads. Licensed content not permitted. ; Product Exceptions
info18 = 6.95
thisrecord1 = %records247800%
}

Else If InStr(trimmedString, "/247900")
{
info0 = 247900 ; Product ID
info1 = Teamwork Ladies Overtime Replica Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 247800 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Yoke and sleeves - 100`% polyester dazzle fabric ; Product Comment One
info17 = Not meant to be worn with pads ; Product Exceptions
info18 = 6.95
thisrecord1 = %records247900%
}

Else If InStr(trimmedString, "/249400")
{
info0 = 249400 ; Product ID
info1 = Sport-Tek Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 15.97
thisrecord1 = %records249400%
}

Else If InStr(trimmedString, "/249500")
{
info0 = 249500 ; Product ID
info1 = Sport-Tek Colorblock Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.91
thisrecord1 = %records249500%
}

Else If InStr(trimmedString, "/249600")
{
info0 = 249600 ; Product ID
info1 = Augusta Colorblock Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab26 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 20.25
thisrecord1 = %records249600%
}

Else If InStr(trimmedString, "/249700")
{
info0 = 249700 ; Product ID
info1 = Champion Colorblock Performance Hooded Sweatshirt ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab26 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.1
thisrecord1 = %records249700%
}

Else If InStr(trimmedString, "/249800")
{
info0 = 249800 ; Product ID
info1 = Team 365 1/4 Zip Performance Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 18.99
thisrecord1 = %records249800%
}

Else If InStr(trimmedString, "/249900")
{
info0 = 249900 ; Product ID
info1 = Nike Golf Dri-FIT Lightweight 1/4 Zip Pullover ; Product Title
info2 := cat3 ; Product Category
info3 := subcat20 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab27 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 37.59
thisrecord1 = %records249900%
}

Else If InStr(trimmedString, "/250800")
{
info0 = 250800 ; Product ID
info1 = Teamwork Turnaround Reversible Basketball Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab32 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Teamwork Turnaround Reversible Basketball Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.95
thisrecord1 = %records250800%
}

Else If InStr(trimmedString, "/250900")
{
info0 = 250900 ; Product ID
info1 = Teamwork Turnaround Reversible Basketball Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab31 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Teamwork Turnaround Reversible Basketball Jersey  ; Product Comment One
info17 = Elastic waist with nylon drawstring (adult sizes only) ; Product Exceptions
info18 = 8.45
thisrecord1 = %records250900%
}

Else If InStr(trimmedString, "/251000")
{
info0 = 251000 ; Product ID
info1 = Core 365 Colorblock Lightweight Full-Zip Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 251100 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 14.99
thisrecord1 = %records251000%
}

Else If InStr(trimmedString, "/251200")
{
info0 = 251200 ; Product ID
info1 = North End Contrast Lightweight Colorblock Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 16.99
thisrecord1 = %records251200%
}

Else If InStr(trimmedString, "/251300")
{
info0 = 251300 ; Product ID
info1 = Ultra Club Full-Zip Hooded Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.95
thisrecord1 = %records251300%
}

Else If InStr(trimmedString, "/251400")
{
info0 = 251400 ; Product ID
info1 = Port Authority Core Colorblock Full-Zip Jacket ; Product Title
info2 := cat12 ; Product Category
info3 := subcat51 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab69 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 17.99
thisrecord1 = %records251400%
}

Else If InStr(trimmedString, "/252000")
{
info0 = 252000 ; Product ID
info1 = North End Soft Shell Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab72 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 24.99
thisrecord1 = %records252000%
}

Else If InStr(trimmedString, "/252200")
{
info0 = 252200 ; Product ID
info1 = Columbia Cathedral Peak Fleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 252300 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records252200%
}

Else If InStr(trimmedString, "/252300")
{
info0 = 252300 ; Product ID
info1 = Columbia Ladies Benton Springs Fleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab66 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 252200 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
thisrecord1 = %records252300%
}

Else If InStr(trimmedString, "/252400")
{
info0 = 252400 ; Product ID
info1 = Port Authority Microfleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 252700 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.69
thisrecord1 = %records252400%
}

Else If InStr(trimmedString, "/252700")
{
info0 = 252700 ; Product ID
info1 = Port Authority Ladies Microfleece Vest ; Product Title
info2 := cat12 ; Product Category
info3 := subcat50 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab65 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 1 ; Product Gender
info13 = 252400 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 11.69
thisrecord1 = %records252700%
}

Else If InStr(trimmedString, "/252800")
{
info0 = 252800 ; Product ID
info1 = Teamwork Fadeaway Reversible Mesh Basketball Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab34 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Teamwork Fadeaway Mesh Basketball Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.18
thisrecord1 = %records252800%
}

Else If InStr(trimmedString, "/252900")
{
info0 = 252900 ; Product ID
info1 = Teamwork Fadeaway Mesh Basketball Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab34 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Teamwork Fadeaway Reversible Mesh Basketball Jersey  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.18
thisrecord1 = %records252900%
}

Else If InStr(trimmedString, "/253100")
{
info0 = 253100 ; Product ID
info1 = Augusta Colorblock Basketball Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Augusta Colorblock Basketball Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.5
thisrecord1 = %records253100%
}

Else If InStr(trimmedString, "/253200")
{
info0 = 253200 ; Product ID
info1 = Augusta Colorblock Basketball Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab20 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the Augusta Colorblock Basketball Jersey  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 7.5
thisrecord1 = %records253200%
}

Else If InStr(trimmedString, "/253300")
{
info0 = 253300 ; Product ID
info1 = High Five Contrast Basketball Jersey ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab30 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the High Five Contrast Basketball Shorts  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.55
thisrecord1 = %records253300%
}

Else If InStr(trimmedString, "/253400")
{
info0 = 253400 ; Product ID
info1 = High Five Contrast Basketball Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab30 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the High Five Contrast Basketball Jersey  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.05
thisrecord1 = %records253400%
}

Else If InStr(trimmedString, "/253400")
{
info0 = 253400 ; Product ID
info1 = High Five Contrast Basketball Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab30 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit1  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = Create a uniform by pairing with the High Five Contrast Basketball Jersey  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 13.05
thisrecord1 = %records253400%
}

Else If InStr(trimmedString, "/30000")
{
info0 = 30000 ; Product ID
info1 = American Apparel Juniors Jersey T-shirt ; Product Title
info2 := cat2 ; Product Category
info3 := subcat5 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco4 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 1 ; Product Gender
info13 = 15000 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 134300 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Colors are a poly/cotton blend ; Product Exceptions
info18 = 4.52
thisrecord1 = %records30000%
}

Else If InStr(trimmedString, "/50000")
{
info0 = 50000 ; Product ID
info1 = Yupoong Twill Flexfit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab92 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 185800 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.25
thisrecord1 = %records50000%
}

Else If InStr(trimmedString, "/52000")
{
info0 = 52000 ; Product ID
info1 = Yupoong Wool Flexfit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat31 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab85 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.75
thisrecord1 = %records52000%
}

Else If InStr(trimmedString, "/73000")
{
info0 = 73000 ; Product ID
info1 = Plastic Stadium Cup ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab113 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records73000%
}

Else If InStr(trimmedString, "/74000")
{
info0 = 74000 ; Product ID
info1 = Big Plastic Stadium Cup ; Product Title
info2 := cat6 ; Product Category
info3 := subcat29 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab113 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 75,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4
info19 = 1
thisrecord1 = %records74000%
}

Else If InStr(trimmedString, "/79000")
{
info0 = 79000 ; Product ID
info1 = Ceramic Mug ; Product Title
info2 := cat6 ; Product Category
info3 := subcat30 ; Product Subcategory
info4 := gen0 ; Product Gender
info5 := deco0 ; Product Decoration
info6 := fab112 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = 72,1 ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5
info19 = 3
thisrecord1 = %records79000%
}

Else If InStr(trimmedString, "/91600")
{
info0 = 91600 ; Product ID
info1 = Gildan 50/50 Crewneck Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat22 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 5.42
thisrecord1 = %records91600%
}

Else If InStr(trimmedString, "/92100")
{
info0 = 92100 ; Product ID
info1 = Yupoong Solid Knit Hat ; Product Title
info2 := cat7 ; Product Category
info3 := subcat32 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco2 ; Product Decoration
info6 := fab80 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit0  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 1.79
thisrecord1 = %records92100%
}

Else If InStr(trimmedString, "/96000")
{
info0 = 96000 ; Product ID
info1 = Soffe Cheer Shorts ; Product Title
info2 := cat3 ; Product Category
info3 := subcat60 ; Product Subcategory
info4 := gen2 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab28 ; Product Fabric
info7 = empty ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit2  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 136000 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 4.99
thisrecord1 = %records96000%
}

Else If InStr(trimmedString, "/96100")
{
info0 = 96100 ; Product ID
info1 = American Apparel Zip Jogger ; Product Title
info2 := cat4 ; Product Category
info3 := subcat21 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab51 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.78
thisrecord1 = %records96100%
}

Else If InStr(trimmedString, "/97600")
{
info0 = 97600 ; Product ID
info1 = American Apparel Long Sleeve T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat2 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 5.7
thisrecord1 = %records97600%
}

Else If InStr(trimmedString, "/98200")
{
info0 = 98200 ; Product ID
info1 = American Apparel Ringer T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab16 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight1 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather Grey is a poly/cotton blend ; Product Exceptions
info18 = 5.72
thisrecord1 = %records98200%
}

Else If InStr(trimmedString, "/98900")
{
info0 = 98900 ; Product ID
info1 = Gildan 50/50 Hooded Sweatshirt ; Product Title
info2 := cat4 ; Product Category
info3 := subcat19 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country1 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 8.91
thisrecord1 = %records98900%
}

Else If InStr(trimmedString, "/99000")
{
info0 = 99000 ; Product ID
info1 = Champion Baseball Raglan ; Product Title
info2 := cat3 ; Product Category
info3 := subcat9 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab33 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 203600 ; Product Youth Adult ID
info16 = Oxford is a poly/cotton blend  ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 6.21
thisrecord1 = %records99000%
}

Else If InStr(trimmedString, "/99600")
{
info0 = 99600 ; Product ID
info1 = Jerzees Zip Hoodie ; Product Title
info2 := cat4 ; Product Category
info3 := subcat23 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab49 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit3  ; Product Fit
info10 := weight0 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 1 ; Product Youth Adult
info15 = 135700 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = empty ; Product Exceptions
info18 = 9.81
thisrecord1 = %records99600%
}

Else If InStr(trimmedString, "/99700")
{
info0 = 99700 ; Product ID
info1 = Gildan Ultra Cotton Pocket T-shirt ; Product Title
info2 := cat1 ; Product Category
info3 := subcat1 ; Product Subcategory
info4 := gen1 ; Product Gender
info5 := deco1 ; Product Decoration
info6 := fab1 ; Product Fabric
info7 = 1 ; Product Fabric Extras
info8 = empty ; Product Specialty Extras
info9 := fit4  ; Product Fit
info10 := weight2 ; Product Weight
info11 := country0 ; Product Country
info12 = 0 ; Product Gender
info13 = 0 ; Product Gender ID
info14 = 0 ; Product Youth Adult
info15 = 0 ; Product Youth Adult ID
info16 = empty ; Product Comment One
info17 = Heather and Safety colors are poly/cotton blend ; Product Exceptions
info18 = 3.86
thisrecord1 = %records99700%
}

else
{
gosub, NotFound
Return
}

prevClip := Clipboard


; Unisex t-shirts start

if ((info2 = cat1) || (info3 = subcat66) || (info3 = subcat72) || (info3 = subcat73))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

if (info12 = 1)
{
compString := info13
; #Include %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if (info4 = unisex)
{
thegender = unisex
}
else
{
thegender = ladies
}


thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%.`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}


if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}


; T-shirts variables

if (info3 = subcat3)
{
singularcat1 = this tank
}

If InStr(info1, "toddler")
{
singularcat1 = this toddler t-shirt
}

If InStr(info1, "one-piece")
{
singularcat1 = this onesie
}

If InStr(info1, "romper")
{
singularcat1 = this romper
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I noticed that your design is saved on our "
tshirtprint2 := " I would love to tell you a little more about it. "
tshirtprint3 := "Check out some of the features for "

if thisrecord1 is not space
{
clipboard=
(
%tshirtprint1%%info10%%A_Space%%info1%!%tshirtprint2%%tshirtprint3%%singularcat1%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}
else
{
clipboard=
(
I noticed that your design is saved on our %info10% %info1%. I would love to tell you a little more about it. %uppercat1% is made with %info6% and it has a %info9%.

Here's some important information about the fit of %singularcat1%:	

- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm

)
}
}

; Category 2 start

if ((info2 = cat2) || (info3 = subcat67))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

if (info12 = 1)
{
compString := info13
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

thegender = unisex
if printgencompinfo1 is not space
{
thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%.`r`n
}
}

;if (info14 = 1)
;{
;compString := info15
;#includeAgain %A_scriptdir%\gen_comp_size_list.ahk
;printyouthcompinfo1 := compinfo1
;thisrecord1 = %thisrecord1%- Certain unisex colors available in youth and adult sizes`r`n
;}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}


; T-shirts variables

if (info3 = subcat3)
{
singularcat1 = this tank
}

If InStr(info1, "tank")
{
singularcat1 = this tank
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I think that you're really going to like our "
tshirtprint2 := " I've included more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

if thisrecord1 is not space
{
clipboard=
(
%tshirtprint1%%info10%%A_Space%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}
else
{
clipboard=
(
I think that you're really going to like our %info10% %info1%! There can be quite a bit of variety with ladies apparel, so I wanted to give you some details about %singularcat1%.! %uppercat1% is made with %info6% and it has a %info9%.

Here's some important information about the fit of %singularcat1%:	

- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm

)
}
}

; Category 3 start

if ((info2 = cat3) || (info3 = subcat85) || (info3 = subcat86) || (info3 = subcat83) || (info3 = subcat84) || (info3 = subcat87) || (info3 = subcat82) || (info3 = subcat88))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

; T-shirts variables

if (info3 = subcat3)
{
singularcat1 = this tank
}

If InStr(info1, "tank")
{
singularcat1 = this tank
}

If InStr(info1, "performance")
{
If InStr(info1, "tank")
{
singularcat1 = this performance tank
}
else if InStr(info1, "pullover")
{
singularcat1 = this performance pullover
}
else if InStr(info1, "sweatshirt")
{
singularcat1 = this performance sweatshirt
}
else if InStr(info1, "polo")
{
singularcat1 = this performance polo
}
else
{
singularcat1 = this performance shirt
}
}

If InStr(info1, "jersey t-shirt")
{
singularcat1 = this jersey t-shirt
}

If InStr(info1, "jersey")
{
singularcat1 = this jersey
}

If InStr(info1, "Soccer")
{
singularcat1 = this soccer jersey
}

If InStr(info1, "Basketball")
{
singularcat1 = this basketball jersey
}

If InStr(info1, "Shorts")
{
singularcat1 = these shorts
}

If InStr(info1, "warm-up jacket")
{
singularcat1 = this warm-up jacket
}

If InStr(info1, "warm-up pant")
{
singularcat1 = these warm up pants
}

If InStr(info1, "varsity jacket")
{
singularcat1 = this varsity jacket
}

If InStr(info1, "hoodie")
{
singularcat1 = this hoodie
}

If InStr(info1, "track jacket")
{
singularcat1 = this track jacket
}



If InStr(info1, "Baseball")
{
If InStr(info1, "Baseball henley")
{
singularcat1 = this t-shirt
}
else
{
singularcat1 = this baseball jersey
}
}

If InStr(info1, "Lacrosse")
{
singularcat1 = this lacrosse jersey
}

if (info3 = subcat11)
{
weight := info10 A_Space
}
else
{
weight=
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%


if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if (info12 = 1)
{
compString := info13

if compString = 230000
{
compgeninfo1 = Canada - New Balance Ladies Tempo Performance Tank
}
else
{
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
}
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}

if printgencompinfo1 is not space
{
thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}
}


if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I have included some more information on "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%weight%%info1%.%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm

)
}
; Start Sweatshirts

if ((info2 = cat4) || (info3 = subcat80) || (info3 = subcat81))
{	
if info0 = 10200
{
gosub, NotFound
}

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "sweatshirt")
{
If InStr(info1, "hooded sweatshirt")
{
singularcat1 = this pullover hoodie
}
else
{
singularcat1 = this sweatshirt
}
}

If InStr(info1, "hoodie")
{
singularcat1 = this hoodie
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}


if (info12 = 1)
{
compString := info13
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}


thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}


; T-shirts variables

If InStr(info1, "lightweight")
{
weight=
}
else if InStr(info1, "heavyweight")
{
weight=
}
else
{
weight := info10 A_Space
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I made sure to include more information on "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%weight%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}

; Start Polos

if ((info2 = cat5) || (info3 = subcat79))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "polo")
{
If InStr(info1, "performance polo")
{
singularcat1 = this performance polo
}
else
{
singularcat1 = this polo
}
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}


if (info12 = 1)
{
compString := info13
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}


thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}


; T-shirts variables

If InStr(info1, "lightweight")
{
weight=
}
else
{
weight := info10 A_Space
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I think that you're really going to like our"
tshirtprint2 := " I made sure to include more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%weight%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}

; Drinkware & Koozies

if (info2 = cat6)
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "cooler")
{
If InStr(info1, "can cooler")
{
singularcat1 = this can cooler
}
else
{
singularcat1 = this bottle cooler
}
}

If InStr(info1, "koozie")
{
singularcat1 = this koozie
}

If InStr(info1, "glass")
{
singularcat1 = this glass
}

If InStr(info1, "flute")
{
singularcat1 = this glass flute
}

If InStr(info1, "bottle")
{
If InStr(info1, "water bottle")
{
singularcat1 = this water bottle
}
else
{
singularcat1 = this bottle
}
}

If InStr(info1, "tumbler")
{
singularcat1 = this tumbler
}

If InStr(info1, "mug")
{
singularcat1 = this mug
}

If InStr(info1, "cup")
{
singularcat1 = this cup
}


if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if info8 is not space
{
loop, parse, info8, `,, ; loop through the list
{
	if (A_Index = 1)
	{
	colorQtyTotal = %A_LoopField%
	}

	if (A_Index = 2)
	{
	prodQtyTotal  = %A_LoopField%
	}
}
prodPrefix = Allows for a maximum of

if (prodQtyTotal > 1)
{
prodSuffix = ink colors
}
else
{
prodSuffix = ink color
}

colorPrefix = Minimum of 
colorSuffix = pieces for purchase

thisrecord1 = %thisrecord1%- %prodPrefix%%A_Space%%prodQtyTotal%%A_Space%%prodSuffix%`r`n- %colorprefix%%A_Space%%colorQtyTotal%%A_Space%%colorSuffix%
}



uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I think that you're really going to like our"
tshirtprint2 := " I made sure to include more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%

How does that all look? Do you think %singularcat1% would work for you?
)
}

; Hats

if ((info2 = cat7) || (info3 = subcat78))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "hat")
{
If InStr(info1, "performance hat")
{
singularcat1 = this performance hat
}
else if InStr(info1, "snapback hat")
{
singularcat1 = this snapback hat
}
else
{
singularcat1 = this hat
}
}

If InStr(info1, "beanie")
{
singularcat1 = this beanie
}

If InStr(info1, "visor")
{
singularcat1 = this visor
}

If InStr(info1, "knit hat")
{
singularcat1 = this knit hat
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}

if (info5 = deco1)
{
decoration = Screenprinted design only
}
else
{
decoration = Embroidered design only
}

thisrecord1 = %thisrecord1%- %decoration%

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I've included more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%.%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%

How does that all look? Do you think %singularcat1% would work for you?
)
}

; Button Down Shirts

if ((info2 = cat9) || (info2 = cat10))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "shirt")
{
If InStr(info1, "dress shirt")
{
singularcat1 = this dress shirt
}
else if InStr(info1, "work shirt")
{
singularcat1 = this work shirt
}
else if InStr(info1, "cook shirt")
{
singularcat1 = this cook's shirt
}
else if InStr(info1, "safety")
{
if InStr(info1, "vest")
{
singularcat1 = this safety vest
}
else
{
singularcat1 = this safety shirt
}
}
else
{
singularcat1 = this button down shirt
}
}

if InStr(info1, "chef coat")
{
singularcat1 = this chef's coat
}

if InStr(info1, "scrub top")
{
singularcat1 = this scrub top
}

if InStr(info1, "apron")
{
singularcat1 = this apron
}


if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if (info12 = 1)
{
compString := info13


; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}

if printgencompinfo1 is not space
{
thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}
}

sizePrefix := "Here's some important information about the fit of "
sizeSuffix := "Open up this link to ensure everyone gets the perfect size!"
sizeLineupStart := "http://www.customink.com/items/sizing/"
sizeLineupFinish := "_lineup/standard.htm"
qPrefix := "How do those details look? Do you think"
qSuffix := "would work for you?"

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")

if InStr(info1, "apron")
{
thisrecord1 = %thisrecord1%`r`n%qPrefix%%A_Space%%singularcat1%%A_Space%%qSuffix%`r`n
}
else
{
thisrecord1 = %thisrecord1%`r`n%sizePrefix%%singularcat1%:`r`n`r`n-*%upperfit1%*`r`n%sizeSuffix%%A_Space%%A_Space%%sizeLineupStart%%info0%%sizeLineupFinish%
}

tshirtprint1 := "I think that you're really going to like our"
tshirtprint2 := " I've included more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
)
}

; Bags

if (info2 = cat11)
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "tote")
{
If InStr(info1, "mini tote")
{
singularcat1 = this mini tote bag
}
else
{
singularcat1 = this tote bag
}
}

If InStr(info1, "cooler")
{
singularcat1 = this cooler
}

If InStr(info1, "cinchpack")
{
singularcat1 = this cinchpack
}

If InStr(info1, "duffel bag")
{
singularcat1 = this duffel bag
}

If InStr(info1, "backpack")
{
singularcat1 = this backpack
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if info8 is not space
{
loop, parse, info8, `,, ; loop through the list
{
	if (A_Index = 1)
	{
	colorQtyTotal = %A_LoopField%
	}

	if (A_Index = 2)
	{
	prodQtyTotal  = %A_LoopField%
	}
}
prodPrefix = Allows for a maximum of

if (prodQtyTotal > 1)
{
prodSuffix = ink colors
}
else
{
prodSuffix = ink color
}

colorPrefix = Minimum of 
colorSuffix = pieces for purchase

thisrecord1 = %thisrecord1%- %prodPrefix%%A_Space%%prodQtyTotal%%A_Space%%prodSuffix%`r`n- %colorprefix%%A_Space%%colorQtyTotal%%A_Space%%colorSuffix%
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I've included more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%.%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%

How does those features look? Do you think %singularcat1% would work for you?
)
}

; Start Outerwear

if ((info2 = cat12) || (info3 = subcat89) || (info3 = subcat90) || (info3 = subcat91))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "jacket")
{
If InStr(info1, "microfleece jacket")
{
singularcat1 = this fleece jacket
}
else if InStr(info1, "fleece jacket")
{
singularcat1 = this fleece jacket
}
else if InStr(info1, "microfleece pullover")
{
singularcat1 = this fleece pullover
}
else if InStr(info1, "soft shell jacket")
{
singularcat1 = this soft shell jacket
}
else if InStr(info1, "warm-up jacket")
{
singularcat1 = this warm-up jacket
}
else if InStr(info1, "varisty jacket")
{
singularcat1 = this varsity jacket
}
else if InStr(info1, "fleece pullover")
{
singularcat1 = this fleece pullover
}
else if InStr(info1, "soft shell parka")
{
singularcat1 = this soft shell parka
}
else
{
singularcat1 = this jacket
}
}

If InStr(info1, "windshirt")
{
singularcat1 = this windshirt
}

If InStr(info1, "vest")
{
singularcat1 = this vest
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}


if (info12 = 1)
{
compString := info13
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}


thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I made sure to include more information on "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%.%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}

; Pens & Supplies

if (info2 = cat13)
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "pad")
{
If InStr(info1, "mouse pad")
{
singularcat1 = this mouse pad
}
else
{
singularcat1 = these Post-It notes
}
}

If InStr(info1, "magnet")
{
singularcat1 = this magnet
}

If InStr(info1, "pen")
{
singularcat1 = this pen
}

If InStr(info1, "bumper sticker")
{
singularcat1 = this bumper sticker
}

If InStr(info1, "decal")
{
singularcat1 = this decal
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if info8 is not space
{
loop, parse, info8, `,, ; loop through the list
{
	if (A_Index = 1)
	{
	colorQtyTotal = %A_LoopField%
	}

	if (A_Index = 2)
	{
	prodQtyTotal  = %A_LoopField%
	}
}
prodPrefix = Allows for a maximum of

if (prodQtyTotal > 1)
{
prodSuffix = ink colors
}
else
{
prodSuffix = ink color
}

colorPrefix = Minimum of 
colorSuffix = pieces for purchase

thisrecord1 = %thisrecord1%- %prodPrefix%%A_Space%%prodQtyTotal%%A_Space%%prodSuffix%`r`n- %colorprefix%%A_Space%%colorQtyTotal%%A_Space%%colorSuffix%
}



uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I think that you're really going to like our"
tshirtprint2 := " I made sure to include more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%

How do those details look? Do you think %singularcat1% would work for you?
)
}

; Start Pants

if ((info2 = cat14) || (info3 = subcat92))
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "pant")
{
If InStr(info1, "performance")
{
singularcat1 = these performance sweatpants
}
else
{
If InStr(info1, "sweatpants")
{
singularcat1 = these sweatpants
}
else
{
singularcat1 = these pants
}
}
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if (info12 = 1)
{
compString := info13
; #includeAgain %A_scriptdir%\gen_comp_list.ahk
printgencompinfo1 = %compgeninfo1%

if info4 = ladies
{
thegender = unisex
}
else
{
thegender = ladies
}


thisrecord1 = %thisrecord1%- The %thegender% complement to %singularcat1% is the %printgencompinfo1%`r`n
}

if (info14 = 1)
{
thisrecord1 = %thisrecord1%- Certain colors available in youth and adult sizes`r`n
}

uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "Your design is currently saved on our"
tshirtprint2 := " I made sure to include more information on "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%.%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%
Here's some important information about the fit of %singularcat1%:

- *%upperfit1%* 
- Open up this link to ensure everyone gets the perfect size!  http://www.customink.com/items/sizing/%info0%_lineup/standard.htm
)
}

; Fun Stuff

if (info2 = cat15)
{	

if (info6 = fab55)
{
}
else
{
StringLower, info6, info6
}

fabshirt = - Made with %info6%

thisrecord1 = %fabshirt%`r`n%thisrecord1%

If InStr(info1, "umbrella")
{
singularcat1 = this umbrella
}

If InStr(info1, "magnet")
{
singularcat1 = this magnet
}

If InStr(info1, "frisbee")
{
singularcat1 = this frisbee
}

If InStr(info1, "rally towel")
{
singularcat1 = this towel
}

If InStr(info1, "ornament")
{
singularcat1 = this ornament
}

if (info16 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info16%`r`n
}

if (info17 = "empty")
{
}
else
{
thisrecord1 = %thisrecord1%- %info17%`r`n
}

if info8 is not space
{
loop, parse, info8, `,, ; loop through the list
{
	if (A_Index = 1)
	{
	colorQtyTotal = %A_LoopField%
	}

	if (A_Index = 2)
	{
	prodQtyTotal  = %A_LoopField%
	}
}
prodPrefix = Allows for a maximum of

if (prodQtyTotal > 1)
{
prodSuffix = ink colors
}
else
{
prodSuffix = ink color
}

colorPrefix = Minimum of 
colorSuffix = pieces for purchase

thisrecord1 = %thisrecord1%- %prodPrefix%%A_Space%%prodQtyTotal%%A_Space%%prodSuffix%`r`n- %colorprefix%%A_Space%%colorQtyTotal%%A_Space%%colorSuffix%
}



uppercat1:=RegExReplace(singularcat1, "^(.)", "$u1")
upperfit1:=RegExReplace(info9, "^(.)", "$u1")
tshirtprint1 := "I think that you're really going to like our"
tshirtprint2 := " I made sure to include more information about "
tshirtprint3 := " below that can be very helpful to make sure all of your needs are met"

clipboard=
(
%tshirtprint1%%A_Space%%info1%!%tshirtprint2%%singularcat1%%tshirtprint3%:

%thisrecord1%

How do those details look? Do you think %singularcat1% would work for you?
)
}


send ^v
sleep 333
clipboard := ""
info13 = ""
compgeninfo1 = ""
compString = ""
sleep 333
clipboard=
(
%prevClip%
)
return

NotFound:
CoordMode, Mouse, Screen
MouseGetPos, xpos, ypos,

Gui, theNotFound:+AlwaysOnTop
Gui, theNotFound:Color, FFFFFF
Gui, theNotFound:Font, S18, w700
Gui, theNotFound:Add, Text, center ym-10 x0 y25 w500 h40, Description Not Available
Gui, theNotFound:Font, S12, w700
Gui, theNotFound:Add, Text, center ym-10 x25 y+10 w450, This product description has not been added to Auto Hotkeys yet. You may either continue to the product catalog or exit.
Gui, theNotFound:Font, S20, w700
Gui, theNotFound:Add, Button, center ym-10 x65 y145 w175 h50 0x200 cBlue gLink, Catalog
Gui, theNotFound:Add, Button, center ym-10 x265 y145 w175 h50 0x200 cBlue gExit, Exit
Gui, theNotFound:Show, x%xpos% y%ypos% h225 w500, Product Description Not Found - AHK
Return

Link:
run, %prevClip%
Gui, theNotFound:destroy
Return

Exit:
Gui, theNotFound:destroy
Return
