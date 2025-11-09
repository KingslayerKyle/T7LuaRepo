require( "ui.uieditor.widgets.Heroes.heroCarouselProgressBar" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.heroCarouselLoadoutItem" )
require( "ui.uieditor.widgets.Heroes.loadoutImageBig" )

local PostLoadFunc = function ( self, controller )
	local gainFocus = self.m_eventHandlers.gain_focus
	self:registerEventHandler( "gain_focus", function ( self, event )
		local equippedSlotModel = self:getModel( controller, "equippedSlot" )
		if equippedSlotModel then
			self.selectionList:findItem( nil, {
				equippedSlot = Engine.GetModelValue( equippedSlotModel )
			}, true )
		end
		return gainFocus( self, event )
	end )
end

CoD.heroCarouselItem_Back = InheritFrom( LUI.UIElement )
CoD.heroCarouselItem_Back.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCarouselItem_Back )
	self.id = "heroCarouselItem_Back"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 816 )
	self:setTopBottom( true, false, 0, 462 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( false, false, -408, 408 )
	background:setTopBottom( false, false, -230, 231 )
	background:setRGB( 0, 0, 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local heroNameLabel = LUI.UITightText.new()
	heroNameLabel:setLeftRight( true, false, 25, 178 )
	heroNameLabel:setTopBottom( true, false, 6.75, 54.75 )
	heroNameLabel:setTTF( "fonts/escom.ttf" )
	heroNameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroNameLabel:setText( Engine.Localize( LocalizeIntoString( modelValue, "HEROES_HERO_NAME_LOADOUT" ) ) )
		end
	end )
	self:addElement( heroNameLabel )
	self.heroNameLabel = heroNameLabel
	
	local heroLevelLabel = LUI.UIText.new()
	heroLevelLabel:setLeftRight( false, false, -395.5, -12.5 )
	heroLevelLabel:setTopBottom( false, true, -60, -35 )
	heroLevelLabel:setRGB( 1, 1, 1 )
	heroLevelLabel:setTTF( "fonts/default.ttf" )
	heroLevelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	heroLevelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroLevelLabel:linkToElementModel( self, "level", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			heroLevelLabel:setText( Engine.Localize( LocalizeIntoString( modelValue, "HEROES_HERO_LEVEL_AND_COUNT" ) ) )
		end
	end )
	self:addElement( heroLevelLabel )
	self.heroLevelLabel = heroLevelLabel
	
	local heroCarouselProgressBar0 = CoD.heroCarouselProgressBar.new( menu, controller )
	heroCarouselProgressBar0:setLeftRight( false, false, -395.5, -191.5 )
	heroCarouselProgressBar0:setTopBottom( false, true, -35, -20 )
	heroCarouselProgressBar0:setRGB( 1, 1, 1 )
	self:addElement( heroCarouselProgressBar0 )
	self.heroCarouselProgressBar0 = heroCarouselProgressBar0
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	local selectionList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 25, 247 )
	selectionList:setTopBottom( true, false, 70.75, 180.75 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setWidgetType( CoD.heroCarouselLoadoutItem )
	selectionList:setHorizontalCount( 2 )
	selectionList:linkToElementModel( self, "loadoutDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectionList:setDataSource( modelValue )
		end
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetHintText( self, element, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local header = LUI.UIText.new()
	header:setLeftRight( true, false, 548.65, 814 )
	header:setTopBottom( true, false, 231.5, 256.5 )
	header:setRGB( 1, 1, 1 )
	header:setTTF( "fonts/escom.ttf" )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	header:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( header )
	self.header = header
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, false, 548.65, 814 )
	itemName:setTopBottom( true, false, 256.5, 304.5 )
	itemName:setRGB( 1, 1, 1 )
	itemName:setTTF( "fonts/escom.ttf" )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemName )
	self.itemName = itemName
	
	local itemDescription = LUI.UIText.new()
	itemDescription:setLeftRight( true, false, 548.65, 806 )
	itemDescription:setTopBottom( true, false, 304.5, 324.5 )
	itemDescription:setRGB( 1, 1, 1 )
	itemDescription:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	itemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemDescription )
	self.itemDescription = itemDescription
	
	local loadoutImageBig0 = CoD.loadoutImageBig.new( menu, controller )
	loadoutImageBig0:setLeftRight( false, false, -128, 128 )
	loadoutImageBig0:setTopBottom( false, false, -128, 128 )
	loadoutImageBig0:setRGB( 1, 1, 1 )
	self:addElement( loadoutImageBig0 )
	self.loadoutImageBig0 = loadoutImageBig0
	
	local hintText = LUI.UIText.new()
	hintText:setLeftRight( true, false, 548.65, 806 )
	hintText:setTopBottom( true, false, 407, 427 )
	hintText:setRGB( 1, 1, 1 )
	hintText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	hintText:subscribeToGlobalModel( controller, "PerController", "hintText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			hintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( hintText )
	self.hintText = hintText
	
	header:linkToElementModel( selectionList, "header", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			header:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemName:linkToElementModel( selectionList, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemDescription:linkToElementModel( selectionList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	loadoutImageBig0:linkToElementModel( selectionList, nil, false, function ( model )
		loadoutImageBig0:setModel( model, controller )
	end )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.heroCarouselProgressBar0:close()
		self.border:close()
		self.selectionList:close()
		self.loadoutImageBig0:close()
		self.heroNameLabel:close()
		self.heroLevelLabel:close()
		self.header:close()
		self.itemName:close()
		self.itemDescription:close()
		self.hintText:close()
		CoD.heroCarouselItem_Back.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

