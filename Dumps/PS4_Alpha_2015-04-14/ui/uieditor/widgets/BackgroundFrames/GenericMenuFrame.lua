require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

CoD.GenericMenuFrame = InheritFrom( LUI.UIElement )
CoD.GenericMenuFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericMenuFrame )
	self.id = "GenericMenuFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, 0, 93 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local bottomBorder = LUI.UIImage.new()
	bottomBorder:setLeftRight( true, true, 0, 0 )
	bottomBorder:setTopBottom( false, true, -63, 0 )
	bottomBorder:setRGB( 0, 0, 0 )
	bottomBorder:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottomBorder )
	self.bottomBorder = bottomBorder
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 62, 139 )
	titleLabel:setTopBottom( true, false, 31.5, 79.5 )
	titleLabel:setRGB( 1, 1, 1 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -70, 539 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0, 146 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		end
	end )
	self.close = function ( self )
		self.cac3dTitleIntermediary0:close()
		CoD.GenericMenuFrame.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

