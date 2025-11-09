require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetNew_InGame" )

CoD.TacticalRigWidget_InGame = InheritFrom( LUI.UIElement )
CoD.TacticalRigWidget_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalRigWidget_InGame )
	self.id = "TacticalRigWidget_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 145 )
	self.anyChildUsesUpdateState = true
	
	local header = LUI.UITightText.new()
	header:setLeftRight( true, false, 0, 45 )
	header:setTopBottom( true, false, -5, 14 )
	header:setRGB( 0.57, 0.6, 0.65 )
	header:setText( Engine.Localize( "MENU_TAC_RIG_CAPS" ) )
	header:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	header:setLetterSpacing( 0.5 )
	self:addElement( header )
	self.header = header
	
	local TacRig2 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	TacRig2:setLeftRight( true, true, 0, 0 )
	TacRig2:setTopBottom( true, false, 83, 145 )
	TacRig2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			TacRig2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( TacRig2 )
	self.TacRig2 = TacRig2
	
	local TacRig1 = CoD.WeaponItemModelWidgetNew_InGame.new( menu, controller )
	TacRig1:setLeftRight( true, true, 0, 0 )
	TacRig1:setTopBottom( true, false, 16, 78 )
	TacRig1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			TacRig1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( TacRig1 )
	self.TacRig1 = TacRig1
	
	local rig1Name = LUI.UIText.new()
	rig1Name:setLeftRight( true, false, 3, 143 )
	rig1Name:setTopBottom( true, false, 25, 41 )
	rig1Name:setRGB( 0.86, 0.89, 0.75 )
	rig1Name:setAlpha( 0 )
	rig1Name:setText( Engine.Localize( "" ) )
	rig1Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rig1Name )
	self.rig1Name = rig1Name
	
	local rig1Upgraded = LUI.UIText.new()
	rig1Upgraded:setLeftRight( true, false, 3, 143 )
	rig1Upgraded:setTopBottom( true, false, 55, 71 )
	rig1Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig1Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig1Upgraded:linkToElementModel( self, "rig1_upgraded", true, function ( model )
		local _rig1Upgraded = Engine.GetModelValue( model )
		if _rig1Upgraded then
			rig1Upgraded:setText( Engine.Localize( _rig1Upgraded ) )
		end
	end )
	self:addElement( rig1Upgraded )
	self.rig1Upgraded = rig1Upgraded
	
	local rig2Name = LUI.UIText.new()
	rig2Name:setLeftRight( true, false, 3, 143 )
	rig2Name:setTopBottom( true, false, 95, 111 )
	rig2Name:setRGB( 0.86, 0.89, 0.75 )
	rig2Name:setAlpha( 0 )
	rig2Name:setText( Engine.Localize( "" ) )
	rig2Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( rig2Name )
	self.rig2Name = rig2Name
	
	local rig2Upgraded = LUI.UIText.new()
	rig2Upgraded:setLeftRight( true, false, 3, 143 )
	rig2Upgraded:setTopBottom( true, false, 124, 140 )
	rig2Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig2Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig2Upgraded:linkToElementModel( self, "rig2_upgraded", true, function ( model )
		local _rig2Upgraded = Engine.GetModelValue( model )
		if _rig2Upgraded then
			rig2Upgraded:setText( Engine.Localize( _rig2Upgraded ) )
		end
	end )
	self:addElement( rig2Upgraded )
	self.rig2Upgraded = rig2Upgraded
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TacRig2:close()
		element.TacRig1:close()
		element.rig1Upgraded:close()
		element.rig2Upgraded:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

