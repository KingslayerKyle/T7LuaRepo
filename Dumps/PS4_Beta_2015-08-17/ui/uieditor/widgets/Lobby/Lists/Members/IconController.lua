CoD.IconController = InheritFrom( LUI.UIElement )
CoD.IconController.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IconController )
	self.id = "IconController"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local four = LUI.UIImage.new()
	four:setLeftRight( true, false, 0, 32 )
	four:setTopBottom( true, false, 0, 32 )
	four:setImage( RegisterImage( "uie_t7_icons_controller_orbis_4" ) )
	four:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( four )
	self.four = four
	
	local three = LUI.UIImage.new()
	three:setLeftRight( true, false, 0, 32 )
	three:setTopBottom( true, false, 0, 32 )
	three:setImage( RegisterImage( "uie_t7_icons_controller_orbis_3" ) )
	three:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( three )
	self.three = three
	
	local two = LUI.UIImage.new()
	two:setLeftRight( true, false, 0, 32 )
	two:setTopBottom( true, false, 0, 32 )
	two:setImage( RegisterImage( "uie_t7_icons_controller_orbis_2" ) )
	two:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( two )
	self.two = two
	
	local one = LUI.UIImage.new()
	one:setLeftRight( true, false, 0, 32 )
	one:setTopBottom( true, false, 0, 32 )
	one:setImage( RegisterImage( "uie_t7_icons_controller_orbis_1" ) )
	one:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( one )
	self.one = one
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				four:completeAnimation()
				self.four:setAlpha( 0 )
				self.clipFinished( four, {} )
				three:completeAnimation()
				self.three:setAlpha( 0 )
				self.clipFinished( three, {} )
				two:completeAnimation()
				self.two:setAlpha( 0 )
				self.clipFinished( two, {} )
				one:completeAnimation()
				self.one:setAlpha( 0 )
				self.clipFinished( one, {} )
			end
		},
		state1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				four:completeAnimation()
				self.four:setAlpha( 0 )
				self.clipFinished( four, {} )
				three:completeAnimation()
				self.three:setAlpha( 0 )
				self.clipFinished( three, {} )
				two:completeAnimation()
				self.two:setAlpha( 0 )
				self.clipFinished( two, {} )
				one:completeAnimation()
				self.one:setAlpha( 1 )
				self.clipFinished( one, {} )
			end
		},
		state2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				four:completeAnimation()
				self.four:setAlpha( 0 )
				self.clipFinished( four, {} )
				three:completeAnimation()
				self.three:setAlpha( 0 )
				self.clipFinished( three, {} )
				two:completeAnimation()
				self.two:setAlpha( 1 )
				self.clipFinished( two, {} )
				one:completeAnimation()
				self.one:setAlpha( 0 )
				self.clipFinished( one, {} )
			end
		},
		state3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				four:completeAnimation()
				self.four:setAlpha( 0 )
				self.clipFinished( four, {} )
				three:completeAnimation()
				self.three:setAlpha( 1 )
				self.clipFinished( three, {} )
				two:completeAnimation()
				self.two:setAlpha( 0 )
				self.clipFinished( two, {} )
				one:completeAnimation()
				self.one:setAlpha( 0 )
				self.clipFinished( one, {} )
			end
		},
		state4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				four:completeAnimation()
				self.four:setAlpha( 1 )
				self.clipFinished( four, {} )
				three:completeAnimation()
				self.three:setAlpha( 0 )
				self.clipFinished( three, {} )
				two:completeAnimation()
				self.two:setAlpha( 0 )
				self.clipFinished( two, {} )
				one:completeAnimation()
				self.one:setAlpha( 0 )
				self.clipFinished( one, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "state1",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "controllerNum", 0 )
			end
		},
		{
			stateName = "state2",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "controllerNum", 1 )
			end
		},
		{
			stateName = "state3",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "controllerNum", 2 )
			end
		},
		{
			stateName = "state4",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "controllerNum", 3 )
			end
		}
	} )
	self:linkToElementModel( self, "controllerNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "controllerNum"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

