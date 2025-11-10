require( "ui.uieditor.widgets.onOffImage" )

CoD.cac_LargePrestigeStars = InheritFrom( LUI.UIElement )
CoD.cac_LargePrestigeStars.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_LargePrestigeStars )
	self.id = "cac_LargePrestigeStars"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local prestigeStar1 = CoD.onOffImage.new( menu, controller )
	prestigeStar1:setLeftRight( true, false, 0, 16 )
	prestigeStar1:setTopBottom( true, false, 0, 16 )
	prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar1.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar1:linkToElementModel( self, nil, false, function ( model )
		prestigeStar1:setModel( model, controller )
	end )
	prestigeStar1:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsWeaponPrestigeLevelAtLeast( element, controller, 1 )
			end
		}
	} )
	prestigeStar1:linkToElementModel( prestigeStar1, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeStar1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeStar1 )
	self.prestigeStar1 = prestigeStar1
	
	local prestigeStar2 = CoD.onOffImage.new( menu, controller )
	prestigeStar2:setLeftRight( true, false, 0, 16 )
	prestigeStar2:setTopBottom( true, false, 16, 32 )
	prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar2.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar2:linkToElementModel( self, nil, false, function ( model )
		prestigeStar2:setModel( model, controller )
	end )
	prestigeStar2:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsWeaponPrestigeLevelAtLeast( element, controller, 2 )
			end
		}
	} )
	prestigeStar2:linkToElementModel( prestigeStar2, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeStar2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeStar2 )
	self.prestigeStar2 = prestigeStar2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		DisplayLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MaxLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayLevel",
			condition = function ( menu, element, event )
				local f13_local0 = IsCurrentMenuWeaponType( menu )
				if f13_local0 then
					f13_local0 = IsCACGunLevelExists( self, element, controller )
					if f13_local0 then
						f13_local0 = not IsCACGunLevelMax( self, element, controller )
					end
				end
				return f13_local0
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f14_local0 = IsCurrentMenuWeaponType( menu )
				if f14_local0 then
					f14_local0 = IsCACGunLevelExists( self, element, controller )
					if f14_local0 then
						f14_local0 = IsCACGunLevelMax( self, element, controller )
					end
				end
				return f14_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.prestigeStar1:close()
		element.prestigeStar2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

