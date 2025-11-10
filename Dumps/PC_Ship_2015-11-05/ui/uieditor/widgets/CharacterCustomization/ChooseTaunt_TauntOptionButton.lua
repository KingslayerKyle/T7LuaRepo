require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.ChooseTaunt_TauntOptionButton = InheritFrom( LUI.UIElement )
CoD.ChooseTaunt_TauntOptionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseTaunt_TauntOptionButton )
	self.id = "ChooseTaunt_TauntOptionButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 209 )
	self:setTopBottom( true, false, 0, 55 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 2, -5 )
	bgImage:setTopBottom( true, true, 5, -5 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, false, 12.49, 194.49 )
	BMGoldBarMed:setTopBottom( true, false, 22.5, 33.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 84, 139 )
	black:setTopBottom( true, false, 19, 36 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon0 = LUI.UIImage.new()
	blackMarketBrandIcon0:setLeftRight( false, false, -26.39, 24.36 )
	blackMarketBrandIcon0:setTopBottom( true, false, 4.13, 54.88 )
	blackMarketBrandIcon0:setAlpha( 0 )
	blackMarketBrandIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon" ) )
	self:addElement( blackMarketBrandIcon0 )
	self.blackMarketBrandIcon0 = blackMarketBrandIcon0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, true, 0, -1.53 )
	StartMenuframenoBG1:setTopBottom( true, true, 3, -3 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, true, 8, -10 )
	itemName:setTopBottom( false, false, -11, 11 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	itemName:linkToElementModel( self, "itemName", true, function ( model )
		local _itemName = Engine.GetModelValue( model )
		if _itemName then
			itemName:setText( Engine.Localize( _itemName ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, true, -108.5, -0.5 )
	IconNew:setTopBottom( false, false, -11.5, 12.5 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( true, true, 0, -1.53 )
	FocusBarB0:setTopBottom( false, true, -7, -3 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( true, true, 0, -1.53 )
	FocusBarT0:setTopBottom( true, false, 3, 7 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 0 )
				self.clipFinished( FocusBarT0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 1 )
				self.clipFinished( FocusBarT0, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.65 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setLeftRight( true, false, 86, 118 )
				self.black:setTopBottom( true, false, 24, 32 )
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon0:completeAnimation()
				self.blackMarketBrandIcon0:setAlpha( 0.65 )
				self.clipFinished( blackMarketBrandIcon0, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 0 )
				self.clipFinished( FocusBarT0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon0:completeAnimation()
				self.blackMarketBrandIcon0:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon0, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 1 )
				self.clipFinished( FocusBarT0, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 0 )
				self.clipFinished( FocusBarT0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 1 )
				self.clipFinished( FocusBarT0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMGoldBarMed:close()
		element.StartMenuframenoBG1:close()
		element.IconNew:close()
		element.FocusBarB0:close()
		element.FocusBarT0:close()
		element.itemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

