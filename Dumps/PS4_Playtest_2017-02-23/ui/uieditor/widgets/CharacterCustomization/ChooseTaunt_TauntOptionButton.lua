require( "ui.uieditor.widgets.ArabicAlignTextBox" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 0, 0, 313 )
	self:setTopBottom( 0, 0, 0, 82 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 3, -7 )
	bgImage:setTopBottom( 0, 1, 8, -8 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 0, 19, 292 )
	BMGoldBarMed:setTopBottom( 0, 0, 34, 50 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 0, 126, 208 )
	black:setTopBottom( 0, 0, 28, 54 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon0 = LUI.UIImage.new()
	blackMarketBrandIcon0:setLeftRight( 0.5, 0.5, -40, 36 )
	blackMarketBrandIcon0:setTopBottom( 0, 0, 6, 82 )
	blackMarketBrandIcon0:setAlpha( 0 )
	blackMarketBrandIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon" ) )
	self:addElement( blackMarketBrandIcon0 )
	self.blackMarketBrandIcon0 = blackMarketBrandIcon0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( 0, 1, 0, -2 )
	StartMenuframenoBG1:setTopBottom( 0, 1, 4, -4 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local itemName = CoD.ArabicAlignTextBox.new( menu, controller )
	itemName:setLeftRight( 0, 1, 12, -12 )
	itemName:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	itemName.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( itemName )
	self.itemName = itemName
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 1, 1, -163, -1 )
	IconNew:setTopBottom( 0.5, 0.5, -17, 19 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0, 1, 0, -2 )
	FocusBarB0:setTopBottom( 1, 1, -11, -5 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( 0, 1, 0, -2 )
	FocusBarT0:setTopBottom( 0, 0, 5, 11 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	self.itemName:linkToElementModel( self, "itemName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarT0:completeAnimation()
		FocusBarB0:completeAnimation()
		bgImage:completeAnimation()
		itemName:completeAnimation()
		blackMarketBrandIcon0:completeAnimation()
		BMGoldBarMed:completeAnimation()
		black:completeAnimation()
		IconNew:completeAnimation()
		FocusBarT0:setAlpha( 0 )
		FocusBarB0:setAlpha( 0 )
		bgImage:setAlpha( 0 )
		itemName:setAlpha( 1 )
		blackMarketBrandIcon0:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		black:setLeftRight( 0, 0, 126, 208 )
		black:setTopBottom( 0, 0, 28, 54 )
		black:setAlpha( 0 )
		IconNew:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.65 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setLeftRight( 0, 0, 129, 177 )
				self.black:setTopBottom( 0, 0, 36, 48 )
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon0:completeAnimation()
				self.blackMarketBrandIcon0:setAlpha( 0.65 )
				self.clipFinished( blackMarketBrandIcon0, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BMGoldBarMed:close()
		self.StartMenuframenoBG1:close()
		self.itemName:close()
		self.IconNew:close()
		self.FocusBarB0:close()
		self.FocusBarT0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

