CoD.Social_PlayersList_PageInfo = InheritFrom( LUI.UIElement )
CoD.Social_PlayersList_PageInfo.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersList_PageInfo )
	self.id = "Social_PlayersList_PageInfo"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 116 )
	self:setTopBottom( true, false, 0, 24 )
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( true, false, 0, 26 )
	upArrow:setTopBottom( true, true, 3, -3 )
	upArrow:setRGB( 1, 1, 1 )
	upArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	upArrow:subscribeToGlobalModel( controller, "Controller", "dpad_up_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			upArrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local pageInfo = LUI.UIText.new()
	pageInfo:setLeftRight( true, false, 26, 99 )
	pageInfo:setTopBottom( false, true, -23, -1 )
	pageInfo:setRGB( 1, 1, 1 )
	pageInfo:setText( Engine.Localize( "299/300" ) )
	pageInfo:setTTF( "fonts/default.ttf" )
	pageInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	pageInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( pageInfo )
	self.pageInfo = pageInfo
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( true, false, 99, 117 )
	downArrow:setTopBottom( true, true, 3, -3 )
	downArrow:setRGB( 1, 1, 1 )
	downArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	downArrow:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			downArrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.close = function ( self )
		self.upArrow:close()
		self.downArrow:close()
		CoD.Social_PlayersList_PageInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

