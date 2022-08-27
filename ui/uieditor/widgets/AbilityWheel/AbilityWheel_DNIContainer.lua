-- 256b57d288673ae500b2f0742febb380
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DNI" )

CoD.AbilityWheel_DNIContainer = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_DNIContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_DNIContainer )
	self.id = "AbilityWheel_DNIContainer"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 184 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local UpperElements = LUI.UIImage.new()
	UpperElements:setLeftRight( false, false, -92, 92 )
	UpperElements:setTopBottom( true, false, 0, 64 )
	UpperElements:setAlpha( 0.99 )
	UpperElements:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_topelement" ) )
	UpperElements:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UpperElements )
	self.UpperElements = UpperElements
	
	local DNI = CoD.AbilityWheel_DNI.new( menu, controller )
	DNI:setLeftRight( false, false, -26, 26 )
	DNI:setTopBottom( false, false, -27, 30 )
	DNI:setAlpha( 0.89 )
	self:addElement( DNI )
	self.DNI = DNI
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local UpperElementsFrame2 = function ( UpperElements, event )
					if not event.interrupted then
						UpperElements:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					UpperElements:setAlpha( 0.99 )
					if event.interrupted then
						self.clipFinished( UpperElements, event )
					else
						UpperElements:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpperElements:completeAnimation()
				self.UpperElements:setAlpha( 1 )
				UpperElementsFrame2( UpperElements, {} )
				local DNIFrame2 = function ( DNI, event )
					if not event.interrupted then
						DNI:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					DNI:setAlpha( 0.89 )
					if event.interrupted then
						self.clipFinished( DNI, event )
					else
						DNI:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DNI:completeAnimation()
				self.DNI:setAlpha( 0.9 )
				DNIFrame2( DNI, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DNI:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

