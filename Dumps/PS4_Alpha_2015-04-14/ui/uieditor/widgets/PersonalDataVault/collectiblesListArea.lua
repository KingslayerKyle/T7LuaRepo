require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.PersonalDataVault.collectibleListItem" )

CoD.collectiblesListArea = InheritFrom( LUI.UIElement )
CoD.collectiblesListArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.collectiblesListArea )
	self.id = "collectiblesListArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 876 )
	self:setTopBottom( true, false, 0, 454 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, false, 480, 846 )
	BorderBakedMask0:setTopBottom( true, false, 0, 470 )
	BorderBakedMask0:setRGB( 0.11, 0.14, 0.17 )
	BorderBakedMask0:setAlpha( 0.6 )
	BorderBakedMask0:setZoom( -40 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, false, 480, 846 )
	BorderBaked0:setTopBottom( true, false, 0, 470 )
	BorderBaked0:setRGB( 1, 1, 1 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local collectiblesList = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	collectiblesList:makeFocusable()
	collectiblesList:setLeftRight( true, false, 0, 470 )
	collectiblesList:setTopBottom( true, false, 0, 470 )
	collectiblesList:setRGB( 1, 1, 1 )
	collectiblesList:setDataSource( "CollectiblesList" )
	collectiblesList:setWidgetType( CoD.collectibleListItem )
	collectiblesList:setHorizontalCount( 3 )
	collectiblesList:setVerticalCount( 3 )
	collectiblesList:setSpacing( 10 )
	self:addElement( collectiblesList )
	self.collectiblesList = collectiblesList
	
	local collectibleImage = LUI.UIImage.new()
	collectibleImage:setLeftRight( true, true, 548, -98 )
	collectibleImage:setTopBottom( true, true, 18, -206 )
	collectibleImage:setRGB( 1, 1, 1 )
	collectibleImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( collectibleImage )
	self.collectibleImage = collectibleImage
	
	local collectibleName = LUI.UITightText.new()
	collectibleName:setLeftRight( true, false, 499, 749 )
	collectibleName:setTopBottom( true, false, 259, 289 )
	collectibleName:setRGB( 1, 1, 1 )
	collectibleName:setTTF( "fonts/escom.ttf" )
	self:addElement( collectibleName )
	self.collectibleName = collectibleName
	
	local collectibleDescription = LUI.UIText.new()
	collectibleDescription:setLeftRight( true, false, 497, 831 )
	collectibleDescription:setTopBottom( true, false, 297, 313 )
	collectibleDescription:setRGB( 1, 1, 1 )
	collectibleDescription:setAlpha( 0.9 )
	collectibleDescription:setTTF( "fonts/UnitedSansRgMd.ttf" )
	collectibleDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	collectibleDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( collectibleDescription )
	self.collectibleDescription = collectibleDescription
	
	collectibleImage:linkToElementModel( collectiblesList, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			collectibleImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	collectibleName:linkToElementModel( collectiblesList, "longName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			collectibleName:setText( Engine.Localize( modelValue ) )
		end
	end )
	collectibleDescription:linkToElementModel( collectiblesList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			collectibleDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	collectiblesList.id = "collectiblesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.collectiblesList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBaked0:close()
		self.collectiblesList:close()
		self.collectibleImage:close()
		self.collectibleName:close()
		self.collectibleDescription:close()
		CoD.collectiblesListArea.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

