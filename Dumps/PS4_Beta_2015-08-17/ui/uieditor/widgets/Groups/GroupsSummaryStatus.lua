CoD.GroupsSummaryStatus = InheritFrom( LUI.UIElement )
CoD.GroupsSummaryStatus.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 7
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSummaryStatus )
	self.id = "GroupsSummaryStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 368 )
	self:setTopBottom( true, false, 0, 17 )
	
	local GroupPrivacy = LUI.UITightText.new()
	GroupPrivacy:setLeftRight( true, false, 0, 56 )
	GroupPrivacy:setTopBottom( true, false, 0, 17 )
	GroupPrivacy:setRGB( 0.52, 0.84, 0.15 )
	GroupPrivacy:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupPrivacy:linkToElementModel( self, "privacy", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupPrivacy:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupPrivacy )
	self.GroupPrivacy = GroupPrivacy
	
	local GroupCreateInfo = LUI.UIText.new()
	GroupCreateInfo:setLeftRight( true, false, 63, 375 )
	GroupCreateInfo:setTopBottom( true, false, 1, 17 )
	GroupCreateInfo:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupCreateInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupCreateInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GroupCreateInfo:linkToElementModel( self, "creationTimestamp", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GroupCreateInfo:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GroupCreateInfo )
	self.GroupCreateInfo = GroupCreateInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				GroupPrivacy:completeAnimation()
				self.GroupPrivacy:setAlpha( 1 )
				self.clipFinished( GroupPrivacy, {} )
				GroupCreateInfo:completeAnimation()
				self.GroupCreateInfo:setAlpha( 1 )
				self.clipFinished( GroupCreateInfo, {} )
			end
		},
		NoGroupSelected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GroupCreateInfo:completeAnimation()
				self.GroupCreateInfo:setAlpha( 0 )
				self.clipFinished( GroupCreateInfo, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoGroupSelected",
			condition = function ( menu, element, event )
				return not HasSelectedGroup( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "groupId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groupId"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupPrivacy:close()
		self.GroupCreateInfo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

