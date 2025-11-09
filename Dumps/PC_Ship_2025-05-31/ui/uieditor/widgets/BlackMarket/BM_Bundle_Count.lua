CoD.BM_Bundle_Count = InheritFrom( LUI.UIElement )
CoD.BM_Bundle_Count.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Bundle_Count )
	self.id = "BM_Bundle_Count"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 50 )
	
	local BundleCount = LUI.UIText.new()
	BundleCount:setLeftRight( true, false, 0, 200 )
	BundleCount:setTopBottom( true, false, 0, 50 )
	BundleCount:setRGB( 0.97, 0.95, 0.68 )
	BundleCount:setAlpha( 0 )
	BundleCount:setScale( 1.7 )
	BundleCount:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	BundleCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "bundles", function ( model )
		local bundles = Engine.GetModelValue( model )
		if bundles then
			BundleCount:setText( Engine.Localize( StringOverrideIfLess( 1, "5", StringOverrideIfLess( 0, "", bundles ) ) ) )
		end
	end )
	self:addElement( BundleCount )
	self.BundleCount = BundleCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 0 )
				self.clipFinished( BundleCount, {} )
			end
		},
		VisibleNotActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 0.8 )
				self.clipFinished( BundleCount, {} )
			end
		},
		VisibleActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 0.8 )
				self.clipFinished( BundleCount, {} )
			end
		},
		Off = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 0 )
				self.clipFinished( BundleCount, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BundleCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

